class Link < ApplicationRecord
  belongs_to :user
  has_many :link_categories
  has_many :categories, through: :link_categories
end
