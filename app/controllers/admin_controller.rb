class AdminController < ApplicationController
  layout 'admin'

  before_action :get_breadcrumbs

  private

  def get_breadcrumbs
    splitted_url = request.original_fullpath.split("/")
    # Remove first object
    splitted_url.shift
    result = splitted_url.map { |element| element.humanize.capitalize }
    session[:breadcrumbs] = result
    # debug
  end
end
