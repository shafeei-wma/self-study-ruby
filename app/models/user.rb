class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  include Discard::Model
  default_scope -> { kept }

  validates :email, uniqueness: true
  validates :password, presence: true
  has_many :posts
end
