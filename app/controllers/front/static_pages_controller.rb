class Front::StaticPagesController < FrontController
  def home
    @last_posts = Post.last(3)
  end

  def contact
  end
end
