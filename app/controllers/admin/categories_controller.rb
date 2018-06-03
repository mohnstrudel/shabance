class Admin::CategoriesController < AdminController
  include CrudConcern

  before_action :find_service, only: [:edit, :update, :destroy]

  def index
    # @categories = index_helper("category")
    if params[:sublevel]
      # Это эквивалентно с
      # @categories = Category.subs
      @categories = index_helper('Category', scope: 'subs')
    else
      @categories = index_helper('Category', scope: 'top_level')
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(service_params)
    create_helper(@category, "edit_admin_category_path")
  end

  def update
    update_helper(@category, "edit_admin_category_path", service_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@category, "admin_categories_path")
  end

  private

  def find_service
    @category = Category.friendly.find(params[:id])
  end

  def service_params
    # params.require(:category).permit(category.attribute_names.map(&:to_sym).push(barcodes_attributes: [:id, :value, :_destroy, :service_id]).push(seo_attributes: [:id, :title, :description, :image, keywords: []]))
    params.require(:category).permit(Category.attribute_names.map(&:to_sym))
  end
end
