module CrudConcern 
  extend ActiveSupport::Concern

  included do
    helper_method :create_helper, :update_helper, :destroy_helper, :index_helper, :edit_helper
  end


  def edit_helper(object)
    begin
      array_of_models = ["Service", "Post", "Article", "Case"]
      current = array_of_models - [object.model_name.name]
      @related = current.map{|i| i.camelize.constantize.tagged_with(object.tag_list, any: true)}.flatten!
    rescue => e

      logger.debug "Схожих сущностей нет. Ошибка: #{e.message}"
    end

  end

  def index_helper(object, options = {})
    keywords = params[:keywords]
    scope = options[:scope] || 'all'
    cat_id = params[:category_id]
    # page_size = Rails.application.config.page_size

    begin
      @objects = object.camelize.constantize.includes(:category).search(keywords).category_scope(cat_id).send(scope).order(created_at: :desc)
    rescue NoMethodError => e
      @objects = object.camelize.constantize.send(scope).order(created_at: :desc)
    end
  end

  def create_helper(object, path)
    begin
      if object.save
        respond_to do |format|
          format.html {
            redirect_to send(path, object)
            flash[:primary] = "Успешно создано!"
          }
        end
      else
        flash[:danger] = "Что-то пошло не так."
        render :new
      end
    rescue => e
      flash[:danger] = e.message
      render :new
    end
  end

  def update_helper(object, path, params)
    begin
      if object.tag_list.empty? && !params[:tag_list].empty?
        object.tag_list.add(params[:tag_list])
      end
    rescue => e
      logger.debug "Ошибка в обновлении. Текст: #{e.message}"
    end

    begin
      if object.update(params)
        respond_to do |format|
          format.html {
            redirect_to send(path, object)
            flash[:primary] = "Успешно обновлено!"
          }
        end
      else
        logger.debug "Encountered errors:"
        logger.debug object.errors.full_messages
        flash[:danger] = "Что-то пошло не так."
        render :edit
      end
    rescue => e
      flash[:danger] = "Encountered errors: #{e.message}"
      render :edit
    end
  end

  def destroy_helper(object, path)
    begin
      if object.destroy
        respond_to do |format|
          format.html {
            redirect_to send(path)
            flash[:primary] = "Well done"    
          }
        end
      else
        flash[:danger] = "Something's not quite right"
        render :index
      end
    rescue ActiveRecord::InvalidForeignKey => e
    # Flash and render, render API json error... whatever
    # Possible error output:
    # Can't delete! PG::ForeignKeyViolation: ERROR: update or delete on table "labels" violates 
    # foreign key constraint "fk_rails_5a55c39b94" on table "products" DETAIL: Key (id)=(2) is 
    # still referenced from table "products". : DELETE FROM "labels" WHERE "labels"."id" = $1

      begin
        redirect_to send(path)
        # redirect_to send(path)
        matched = /(?<=from table)(.*?)(?=\.)/.match(e.message)
        array_of_record_ids = error_record_lookup(matched[0], object)
        flash[:danger] = "Can't delete record because #{object.class.name.downcase} with id #{object.id} is referenced in table #{matched[0]}, records with id(s) - #{array_of_record_ids}"
      rescue
        # redirect_to send(path)
        flash[:danger] = "Эта родительская сущность. Так как у нее присутствуют дочерние записи, её нельзя удалить на данный момент. Сначала нужно удалить дочерние записи. Полный текст ошибки: #{e.message}"
      end
    end
  end

  def error_record_lookup(class_as_string, object_as_instance_variable)
    # We receive class name as downcase string
    # "products".singularize.capitalize.constantize
    class_as_string.tr('^A-Za-z', '').singularize.capitalize.constantize.where("#{object_as_instance_variable.class.name.downcase}_id = ?", object_as_instance_variable.id).map{ |item| item.id}
    # this returns an array of all records where intial record is mentioned
  end

end