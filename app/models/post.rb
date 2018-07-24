class Post < ApplicationRecord

  acts_as_taggable_on :tags
  
  belongs_to :post_category

  before_save :set_slug

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploaders :images, LogoUploader
  serialize :images, JSON # If you use SQLite, add this line.

  private

  def set_slug
    unless self.nil?
      if self.slug.blank?
        begin
          slugged = Russian.translit(self.title).parameterize
          self.slug = slugged
        rescue => e
          logger.debug "Error while saving slug for #{self.inspect}. Error message: #{e.message}"
          self.slug = nil
        end
      end
    end
  end
end
