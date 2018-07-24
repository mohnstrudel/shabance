class Admin::ImagesController < AdminController
  before_action :set_post

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Не удалось удалить изображение" unless @post.save
    redirect_to edit_admin_post_path(@post)
  end

  private

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end

  def remove_image_at_index(index)
    remain_images = @post.images # copy the array
    deleted_image = remain_images.delete_at(index) # delete the target image
    deleted_image.try(:remove!) # delete image from S3
    @post.images = remain_images # re-assign back
  end

  def images_params
    params.require(:images).permit({images: []}) # allow nested params as array
  end
end
