class Link < ApplicationRecord
  belongs_to :user
  has_many :linkcategories
  has_many :categories, through: :linkcategories
end
