class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :main_guest
  has_and_belongs_to_many :guests, dependent: :delete_all

  enum attendance: { pending: 0, yes: 1, no: 2 }

  def attendance_enum
    self.class.attendances
  end

  def attendance= value
    if value.kind_of?(String) and value.to_i.to_s == value
      super value.to_i
    else
      super value
    end
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
