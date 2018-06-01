module AdminHelper

  def url_for_page page
    if page.slug.present?
      page.slug
    else
      "pages/#{page.id}"
    end
  end

  def nav_link(link_path, &block)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_path, &block
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
end
