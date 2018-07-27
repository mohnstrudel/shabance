class Post < ApplicationRecord

  acts_as_taggable_on :tags
  
  belongs_to :post_category

  before_save :set_slug

  before_save :set_keywords

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploaders :images, LogoUploader
  serialize :images, JSON # If you use SQLite, add this line.

  def get_video_url
    start = video =~ /watch\?v=/
    string_to_compare_length = 'watch?v='.length
    the_end = video.length-3
    return video[start+string_to_compare_length..the_end]
  end

  def formatted_date
    created_at.strftime("%d %b %Y")
  end


  def next
    # Post.active.where("published_at > ?", published_at).order("published_at DESC").last
    Post.where("id > ?", id).order("id ASC").last
  end

  def prev
    # Post.active.where("published_at < ?", published_at).order("published_at DESC").first
    Post.where("id < ?", id).order("id DESC").first
  end



  def self.search(keyword)
    if keyword.present?
      where('keywords LIKE ?', "%#{keyword.downcase}%")
    else
      all
    end
  end

  protected
  
  def set_keywords
    self.keywords = [title, body].map(&:downcase).join(' ')
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
