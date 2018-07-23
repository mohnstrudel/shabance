class FrontController < ApplicationController
  layout 'front'

  before_action :get_setting

  def get_setting
    @settings = Setting.first
    @additional_phones = @settings.phones.any? ? @settings.phones : nil

  end
end
