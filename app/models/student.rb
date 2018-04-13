class Student < ApplicationRecord
  mount_uploader :image, ImageUploader
end
