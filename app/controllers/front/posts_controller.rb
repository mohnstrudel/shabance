class Front::PostsController < FrontController

  def index
    @posts = Post.all
    @additional_class = 'page-content-wrap2'
    @display_breadcrumbs = true
    @title = 'Блоги'
  end

  def show
    @post = Post.friendly.find(params[:id])
  end
end
