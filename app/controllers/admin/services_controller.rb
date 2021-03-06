class Admin::ServicesController < AdminController
  include CrudConcern

  before_action :find_service, only: [:edit, :update, :destroy]

  def index
    # @services = service.all
    @services = index_helper("service")
  end

  def new
    @service = Service.new
    @service.blocks.build
    @service.build_seo
  end

  def create
    @service = Service.new(service_params)
    create_helper(@service, "edit_admin_service_path")
  end

  def update
    update_helper(@service, "edit_admin_service_path", service_params)
  end

  def edit
    edit_helper(@service)
    if @service.seo.blank?
      @service.build_seo
    end
    if @service.blocks.blank?
      @service.blocks.build
    end
    # if @service.seo.blank?
    #   @service.build_seo
    # end
  end

  def destroy
    destroy_helper(@service, "admin_services_path")
  end

  private

  def find_service
    @service = Service.friendly.find(params[:id])
  end

  def service_params
    # params.require(:service).permit(service.attribute_names.map(&:to_sym).push(barcodes_attributes: [:id, :value, :_destroy, :service_id]).push(seo_attributes: [:id, :title, :description, :image, keywords: []]))
    params.require(:service).permit(Service.attribute_names.map(&:to_sym).push(blocks_attributes: [:id, :block_body, :_destroy, :service_id ]).push(tag_list:[]).push(:avatar).push(seo_attributes: [:id, :title, :description, :image, keywords: []]))
  end
end
