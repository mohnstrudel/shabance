class Category < ApplicationRecord

  before_save :set_slug
  
  has_many :subcategories, class_name: "Category", foreign_key: :parent_id, dependent: :destroy

  belongs_to :parent, class_name: "Category", optional: true

  has_many :services, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :top_level, -> { where(parent_id: nil) }
  scope :subs, lambda { where("parent_id IS NOT NULL") }


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
