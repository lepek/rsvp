class Event < ApplicationRecord
  has_many :invitations

  mount_uploader :image, ImageUploader
  mount_uploader :header, HeaderUploader

end
