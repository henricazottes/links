class Link < ApplicationRecord
  include PgSearch
  pg_search_scope :global_search, {
    against: [:title, :url],
    associated_against: {
      user: [:username]
    },
    using: {
      tsearch: {any_word: true},
      trigram: {
        word_similarity: true
      }
    },
    ignoring: :accents,
  }
  belongs_to :user
  has_many :link_categories
  has_many :categories, through: :link_categories
end
