class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_token
  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true, length:{minimum:6}


  has_many :questions

  has_many :answers

  include PgSearch

  pg_search_scope :search_name, against: :username
  pg_search_scope :search_all_partial_matches, 
    against: [:username, :email], 
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_all_variants, 
    against: => :username, 
      using: { 
        tsearch: { dictionary: 'english' }
      }
end
