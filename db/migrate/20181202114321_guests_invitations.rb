class GuestsInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :guests_invitations do |t|
      t.belongs_to :guest, index: true
      t.belongs_to :invitation, index: true
    end
  end
end
