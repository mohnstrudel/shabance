class Front::SubcategoriesController < FrontController

  def index
    @parent_category = Category.friendly.find(params[:category_id])
    @subcategories = @parent_category.subcategories
    @display_breadcrumbs = true
    @title = @parent_category.title

    # @services = Category.subs.includes(:services).services
    # @services = Child.join(:parent).merge(Parent.where("[various conditions]"))
    # @services = Service.joins(:category).merge(@subcategories)
    @services = Service.where(:category_id => @subcategories.pluck(:id))

  end
end
