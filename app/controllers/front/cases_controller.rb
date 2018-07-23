class Front::CasesController < FrontController

  def index
    @cases = Case.all
    @additional_class = 'page-content-wrap2'
    @display_breadcrumbs = true
    @title = "Реализованные кейсы"
  end
end
