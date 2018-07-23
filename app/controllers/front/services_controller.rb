class Front::ServicesController < FrontController

  def show
    @service = Service.friendly.find(params[:id])
    @additional_class = 'page-content-wrap2'
    @display_breadcrumbs = true
    @title = @service.title

    @related_cases = Case.tagged_with(@service.tag_list, any: true)
    @related_services = Service.tagged_with(@service.tag_list, any: true)

    @categories = Category.top_level
  end
end
