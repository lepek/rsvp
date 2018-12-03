class MainGuest < ApplicationRecord
  has_many :invitations
  has_many :guests

  def full_name
    first_name + ' ' + last_name
  end
end
