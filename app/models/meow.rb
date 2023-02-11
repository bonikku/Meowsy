class Meow < ApplicationRecord
  belongs_to :user

  validates :body, length: { maximum: 240 }, allow_blank: false
end
