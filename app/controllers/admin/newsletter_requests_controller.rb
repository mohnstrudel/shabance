class Admin::NewsletterRequestsController < AdminController
  
  include CrudConcern

  before_action :find_newsletter_request, only: [:edit, :update, :destroy]

  def index
    @newsletter_requests = index_helper("newsletter_request")
  end

  def new
    @newsletter_request = NewsletterRequest.new
  end

  def create
    @newsletter_request = NewsletterRequest.new(newsletter_request_params)
    create_helper(@newsletter_request, "edit_admin_newsletter_request_path")
  end

  def update
    update_helper(@newsletter_request, "edit_admin_newsletter_request_path", newsletter_request_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@newsletter_request, "admin_newsletter_requests_path")
  end

  private

  def find_newsletter_request
    @newsletter_request = NewsletterRequest.find(params[:id])
  end

  def newsletter_request_params
    params.require(:newsletter_request).permit(NewsletterRequest.attribute_names.map(&:to_sym))
  end
end
