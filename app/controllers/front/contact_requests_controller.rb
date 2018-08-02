class Front::ContactRequestsController < FrontController

  def create
    @request = ContactRequest.new(request_params)

    respond_to do |format|
      if @request.save
        format.js
        RequestMailer.notify_admin(@request).deliver_now
        RequestMailer.notify_client(@request).deliver_now
      else
        format.js { render partial: 'fail.js' }
        # format.html { render partial: 'fail.js' }
      end
    end
  end

  private 

  def request_params
    params.require(:contact_request).permit(ContactRequest.attribute_names.map(&:to_sym))
  end

end
