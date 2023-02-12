class Meow < ApplicationRecord
  include Likeable
  belongs_to :user
  belongs_to :meow, optional: true
  has_many :comments

  validates :body, length: { maximum: 240 },
            allow_blank: false, unless: :meow_id

  def meow_type
    if meow_id? && body?
      "quote-meow"
    elsif meow_id?
      "remeow"
    else
      "meow"
    end
  end
end
