class Front::ArticlesController < FrontController

  def index
    article_amount = Article.count
    page_size = Rails.application.config.page_size
    @page = (params[:page] || 1).to_i
    @pages_total = article_amount / page_size
    if article_amount%page_size != 0
      @pages_total += 1
    end

    # @blueprints = Blueprint.search(params[:search])

    # Фильтрация по категориям
    if params[:category]
      @articles = Article.search(params[:search]).where(article_category: params[:category])
    else
      @articles = Article.search(params[:search])
    end
    # @pagy, @articles = pagy(Article.all, items: 1)

    @article_categories = ArticleCategory.all

    @last_articles = Article.last(3)

    @additional_class = 'page-content-wrap2'
    @display_breadcrumbs = true
    @title = 'Статьи'

    @tags = Article.all.includes(:tags).map(&:tags).flatten.pluck(:name)


  end

  def show
    @additional_class = 'page-content-wrap2'
    @display_breadcrumbs = true
    
    @article = Article.friendly.find(params[:id])
    @title = @article.title

    @related_cases = Case.tagged_with(@article.tag_list, any: true).last(2)
    @related_services = Service.tagged_with(@article.tag_list, any: true).last(2)
    @related_articles = Article.tagged_with(@article.tag_list, any: true).last(2)
  end
end
