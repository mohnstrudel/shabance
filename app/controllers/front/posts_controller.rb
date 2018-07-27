class Front::PostsController < FrontController

  

  def index
    post_amount = Post.count
    page_size = Rails.application.config.page_size
    @page = (params[:page] || 1).to_i
    @pages_total = post_amount / page_size
    if post_amount%page_size != 0
      @pages_total += 1
    end

    # @blueprints = Blueprint.search(params[:search])

    # Фильтрация по категориям
    if params[:category]
      @posts = Post.search(params[:search]).where(post_category: params[:category])
    else
      @posts = Post.search(params[:search])
    end
    # @pagy, @posts = pagy(Post.all, items: 1)

    @post_categories = PostCategory.all

    @last_posts = Post.last(3)

    @additional_class = 'page-content-wrap2'
    @display_breadcrumbs = true
    @title = 'Блоги'

    @tags = Post.all.includes(:tags).map(&:tags).flatten.pluck(:name)


  end

  def show
    @additional_class = 'page-content-wrap2'
    @display_breadcrumbs = true
    
    @post = Post.friendly.find(params[:id])
    @title = @post.title

    @related_cases = Case.tagged_with(@post.tag_list, any: true).last(2)
    @related_services = Service.tagged_with(@post.tag_list, any: true).last(2)
    @related_posts = Post.tagged_with(@post.tag_list, any: true).last(2)
  end
end
