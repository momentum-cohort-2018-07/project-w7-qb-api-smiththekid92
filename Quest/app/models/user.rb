class User < ApplicationRecord
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true, length:{minimum:6}


  has_many :questions

  has_many :answers
end
