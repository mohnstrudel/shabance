class NewsletterRequest < ApplicationRecord

validates :email, presence: true

end
