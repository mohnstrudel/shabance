class Service < ApplicationRecord

  acts_as_taggable_on :tags

  before_save :set_slug

  belongs_to :category

  has_many :blocks, dependent: :destroy
  accepts_nested_attributes_for :blocks, :allow_destroy => true

  has_one :seo, dependent: :destroy
  accepts_nested_attributes_for :seo, allow_destroy: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  # has_one_attached :avatar

  def formatted_date
    created_at.strftime("%d %b %Y")
  end

  mount_uploader :logo, LogoUploader

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
