class Seo < ApplicationRecord

  belongs_to :post, optional: true
  belongs_to :setting, optional: true
  belongs_to :article, optional: true
  belongs_to :service, optional: true
  
  mount_uploader :image, LogoUploader

  def build_image
    if image.present?
      return image.thumb_mini.url
    else
      return nil
    end
  end

end
