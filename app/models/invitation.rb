class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :main_guest
  has_and_belongs_to_many :guests, dependent: :delete_all

  def attendance_enum
    { 'Pending' => 0, 'Yes' => 1, 'No' => 2 }
  end

  def guest_name
    if main_guest
      total_guests = adults + kids
      "#{event.name} - #{main_guest.full_name} + #{total_guests}"
    else
      ''
    end
  end
end
