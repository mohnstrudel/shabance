class Admin::SettingsController < AdminController

  include CrudConcern

  before_action :find_setting, only: [:edit, :update, :destroy]

  def index
    @settings = index_helper("setting")
  end

  def new
    @setting = Setting.new
    @setting.phones.build
    @setting.opening_hours.build
  end

  def create
    @setting = Setting.new(setting_params)
    create_helper(@setting, "edit_admin_setting_path")
  end

  def update
    update_helper(@setting, "edit_admin_setting_path", setting_params)
  end

  def edit
    edit_helper(@setting)
    if @setting.phones.blank?
      @setting.phones.build
    end
    if @setting.opening_hours.blank?
      @setting.opening_hours.build
    end
  end

  def destroy
    destroy_helper(@setting, "admin_settings_path")
  end

  private

  def find_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(Setting.attribute_names.map(&:to_sym).push(phones_attributes: [:id, :value, :_destroy, :setting_id]).
      push(opening_hours_attributes: [:id, :title, :value, :_destroy, :setting_id]))
  end
end
