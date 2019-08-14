class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  mount_uploader :image, ImageUploader
end
