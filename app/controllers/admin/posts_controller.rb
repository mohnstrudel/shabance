class Admin::PostsController < AdminController
  
  include CrudConcern

  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    @posts = index_helper("post")
  end

  def new
    @post = Post.new
    if @post.seo.blank?
      @post.build_seo
    end
  end

  def create
    @post = Post.new(post_params)
    create_helper(@post, "edit_admin_post_path")
  end

  def update
    update_helper(@post, "edit_admin_post_path", post_params)
  end

  def edit
    if @post.seo.blank?
      @post.build_seo
    end
    edit_helper(@post)
  end

  def destroy
    destroy_helper(@post, "admin_posts_path")
  end

  private

  def find_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(Post.attribute_names.map(&:to_sym).push(tag_list:[]).push({ images: [] }).push(seo_attributes: [:id, :title, :description, :image, keywords: []]))
  end
end