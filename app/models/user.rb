class User < ApplicationRecord
	# validates :name, presence: true, length: { maximam: 30 }
	# validates :email, presence: true, length: { maximam: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	# before_validation { mail.dawncase! }
	# has_secure_password
	# validates :password, presence: true, length: { minimum: 6 }
	# mount_uploader :user_icone, ImageUploader
	# has_many :posts
	# has_many :favorites, dependent: :destroy
end
