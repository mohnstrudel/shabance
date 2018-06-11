class Admin::ContactRequestsController < AdminController
  
  include CrudConcern

  before_action :find_contact_request, only: [:edit, :update, :destroy]

  def index
    @contact_requests = index_helper("contact_request")
  end

  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)
    create_helper(@contact_request, "edit_admin_contact_request_path")
  end

  def update
    update_helper(@contact_request, "edit_admin_contact_request_path", contact_request_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@contact_request, "admin_contact_requests_path")
  end

  private

  def find_contact_request
    @contact_request = ContactRequest.find(params[:id])
  end

  def contact_request_params
    params.require(:contact_request).permit(ContactRequest.attribute_names.map(&:to_sym))
  end
end