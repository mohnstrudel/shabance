class Article < ApplicationRecord

  acts_as_taggable_on :tags
  
  belongs_to :article_category

  before_save :set_slug

  has_one :seo, dependent: :destroy
  accepts_nested_attributes_for :seo, allow_destroy: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  def formatted_date
    created_at.strftime("%d %b %Y")
  end


  def next
    # Post.active.where("published_at > ?", published_at).order("published_at DESC").last
    Article.where("id > ?", id).order("id ASC").last
  end

  def prev
    # Post.active.where("published_at < ?", published_at).order("published_at DESC").first
    Article.where("id < ?", id).order("id DESC").first
  end



  def self.search(keyword)
    if keyword.present?
      where('keywords LIKE ?', "%#{keyword.downcase}%")
    else
      all
    end
  end

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
