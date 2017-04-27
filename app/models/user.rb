class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true,
    uniqueness: { message: "An account already exists for that email address!" }

  has_many :reviews
  has_many :votes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def admin?
    role == "admin"
  end
end
