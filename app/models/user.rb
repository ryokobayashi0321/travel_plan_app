class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ゲストアカウントを取得する
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # AvatarUploaderとavatarカラムの連携
  mount_uploader :avatar, AvatarUploader

  validates :user_name, presence: true
  validates :avatar, length: { maximum: 200 }
end
