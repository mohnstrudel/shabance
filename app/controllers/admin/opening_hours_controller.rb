class Admin::OpeningHoursController < AdminController
  
  include CrudConcern

  before_action :find_opening_hour, only: [:edit, :update, :destroy]

  def index
    @opening_hours = index_helper("opening_hour")
  end

  def new
    @opening_hour = OpeningHour.new
  end

  def create
    @opening_hour = OpeningHour.new(opening_hour_params)
    create_helper(@opening_hour, "edit_admin_opening_hour_path")
  end

  def update
    update_helper(@opening_hour, "edit_admin_opening_hour_path", opening_hour_params)
  end

  def edit
    edit_helper(@opening_hour)
  end

  def destroy
    destroy_helper(@opening_hour, "admin_opening_hours_path")
  end

  private

  def find_opening_hour
    @opening_hour = OpeningHour.find(params[:id])
  end

  def opening_hour_params
    params.require(:opening_hour).permit(OpeningHour.attribute_names.map(&:to_sym))
  end
end
