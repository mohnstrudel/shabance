class Front::NewsletterRequestsController < FrontController



  def create
    @request = NewsletterRequest.new(request_params)

    respond_to do |format|
      if @request.save
        format.js
      else
        format.js { render partial: 'fail.js' }
        # format.html { render partial: 'fail.js' }
      end
    end
  end

  private 

  def request_params
    params.require(:newsletter_request).permit(NewsletterRequest.attribute_names.map(&:to_sym))
  end
end
