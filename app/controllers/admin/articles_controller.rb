class Admin::ArticlesController < AdminController
  
  include CrudConcern

  before_action :find_article, only: [:edit, :update, :destroy]

  def index
    @articles = index_helper("article")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    create_helper(@article, "edit_admin_article_path")
  end

  def update
    update_helper(@article, "edit_admin_article_path", article_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@article, "admin_articles_path")
  end

  private

  def find_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    # params.require(:article).permit(article.attribute_names.map(&:to_sym).push(barcodes_attributes: [:id, :value, :_destroy, :article_id]).push(seo_attributes: [:id, :title, :description, :image, keywords: []]))
    params.require(:article).permit(Article.attribute_names.map(&:to_sym))
  end
end


