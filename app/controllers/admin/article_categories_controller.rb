class Admin::ArticleCategoriesController < AdminController
  include CrudConcern

  before_action :find_article_category, only: [:edit, :update, :destroy]

  def index
    @article_categories = index_helper("article_category")
  end

  def new
    @article_category = ArticleCategory.new
  end

  def create
    @article_category = ArticleCategory.new(article_category_params)
    create_helper(@article_category, "edit_admin_article_category_path")
  end

  def update
    update_helper(@article_category, "edit_admin_article_category_path", article_category_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@article_category, "admin_article_categories_path")
  end

  private

  def find_article_category
    @article_category = ArticleCategory.friendly.find(params[:id])
  end

  def article_category_params
    params.require(:article_category).permit(ArticleCategory.attribute_names.map(&:to_sym))
  end
end



