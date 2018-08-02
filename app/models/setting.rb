class Setting < ApplicationRecord
  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones, :allow_destroy => true

  has_many :opening_hours, dependent: :destroy
  accepts_nested_attributes_for :opening_hours, :allow_destroy => true

  has_one :seo, dependent: :destroy
  accepts_nested_attributes_for :seo, allow_destroy: true

end
