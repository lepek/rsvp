class Guest < ApplicationRecord
  has_and_belongs_to_many :invitations
  belongs_to :main_guest
end
