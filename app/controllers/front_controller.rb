class FrontController < ApplicationController
  layout 'front'

  before_action :get_setting

  include Pagy::Backend

  def get_setting
    @settings = Setting.first
    @additional_phones = @settings.phones.any? ? @settings.phones : nil

  end
end
