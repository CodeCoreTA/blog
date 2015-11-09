class User < ActiveRecord::Base
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end


end
