class Category < ApplicationRecord
  has_many :linkcategories
  has_many :links, through: :linkcategories
end
