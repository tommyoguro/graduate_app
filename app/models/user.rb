class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def admin?
    self.is_admin
  end

  def self.guest_find_or_create
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.admin_guest_find_or_create
    find_or_create_by!(email: 'admin_guest@example.com') do |admin_user|
      admin_user.name = '管理者ゲスト'
      admin_user.password = SecureRandom.urlsafe_base64
      admin_user.is_admin = true
    end
  end
end
