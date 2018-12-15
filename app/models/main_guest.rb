class MainGuest < ApplicationRecord
  has_many :invitations
  has_many :guests

  def full_name
    if first_name && last_name
      first_name + ' ' + last_name
    end
  end
end
