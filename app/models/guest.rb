class Guest < ApplicationRecord
  has_and_belongs_to_many :invitations
  belongs_to :main_guest

  def full_name
    first_name + ' ' + last_name
  end
end
