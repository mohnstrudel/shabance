module AdminHelper

  def url_for_page page
    if page.slug.present?
      page.slug
    else
      "pages/#{page.id}"
    end
  end

  def nav_link(link_path, options={}, &block)
    class_name = current_page?(link_path) ? 'active' : ''
    additional_class = " #{options[:class]}"
    sublevel = options[:sublevel]

    content_tag(:li, :class => "#{class_name}#{additional_class}") do
      link_to link_path, sublevel: sublevel, &block
    end
  end

  def object_name(object)
    if object.is_a?(ActiveRecord::Relation)
      return object.model.name.underscore
    else
      return object.class.name.underscore
    end
  end

  def admin_form_arguments_builder(object, namespace=nil)
    if namespace
      namespace = namespace.tr('_','')
      return [:admin, namespace.to_sym, object]
    else
      return [:admin, object]
    end
  end

  def breadcrumbs
    # Session breadcrumbs is defines in the admin_controller via a before_action filter
    bc = session[:breadcrumbs]
    if bc
      @content = content_tag("h2", bc.last)
      @content << content_tag(:ol, class: "breadcrumb") do
          bc.collect do |crumb|
            if crumb.equal? bc.last
              content_tag(:li, "<strong>#{crumb}</strong>".html_safe, class: "active")
            else
              content_tag(:li, crumb)
            end
          end.join.html_safe
        end

      # End result should look like this:
      #  %h2 Static Tables
      #  %ol.breadcrumb
      #   %li
      #    %a{:href => "index.html"} Home
      #   %li
      #    %a Tables
      #   %li.active
      #    %strong Static Tables

      return @content
    else
      return ""
    end
  end

  def link_to_add_fields(name, f, association, partial_path=nil, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      if partial_path
        render(partial_path, f: builder)
      else
        render(association.to_s.singularize + "_fields", f: builder)
      end
    end
    link_to(name, '#', class: 'add_fields ' + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end

  def logo_tag_or_default(object, options = {})
    thumb = options[:thumb]
    size = options[:size]
    if object.logo.present?
      if object.logo.send(thumb).present?
        return image_tag(object.logo.send(thumb).url, class: options[:class])
      end
    else
      return placeholdit_image_tag size, text: "No image", class: options[:class]
    end
  end

  def medium_picture(object)
    if object.logo?
      return image_tag(object.logo.thumb_middle_size.url, width: 114, height: 84)
    elsif object.images.present?
      return image_tag(object.images.first.thumb_middle_size.url, width: 114, height: 84)
    else
      return placeholdit_image_tag '114x84', text: "No image"
    end
  end
end
