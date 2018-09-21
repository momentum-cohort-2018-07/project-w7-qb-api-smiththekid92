class Answer < ApplicationRecord
belongs_to :user
belongs_to :question

validates :title, :body, presence: true

include PgSearch

pg_search_scope :search_name, against: :title
pg_search_scope :search_all_variants, 
  against: [:title, :body], 
    using: { 
      tsearch: { dictionary: 'english' }
    }
  
  pg_search_scope :search_all_partial_matches, 
    against: [:title, :body], 
    using: {
      tsearch: { prefix: true }
    }

end
