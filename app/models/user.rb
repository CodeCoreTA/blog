class User < ActiveRecord::Base
  has_many :posts, dependent: :nullify
  has_secure_password

  validates :email, presence: true, uniqueness: true

end
