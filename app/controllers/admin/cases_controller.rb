class Admin::CasesController < AdminController
  include CrudConcern

  before_action :find_case, only: [:edit, :update, :destroy]

  def index
    @cases = index_helper("case")
  end

  def new
    @case = Case.new
  end

  def create
    @case = Case.new(case_params)
    create_helper(@case, "edit_admin_case_path")
  end

  def update
    update_helper(@case, "edit_admin_case_path", case_params)
  end

  def edit
    edit_helper(@case)
  end

  def destroy
    destroy_helper(@case, "admin_cases_path")
  end

  private

  def find_case
    @case = Case.friendly.find(params[:id])
  end

  def case_params
    # params.require(:case).permit(case.attribute_names.map(&:to_sym).push(barcodes_attributes: [:id, :value, :_destroy, :case_id]).push(seo_attributes: [:id, :title, :description, :image, keywords: []]))
    params.require(:case).permit(Case.attribute_names.map(&:to_sym).push(blocks_attributes: [:id, :block_body, :_destroy, :case_id ]).push(tag_list: []))
  end
end

