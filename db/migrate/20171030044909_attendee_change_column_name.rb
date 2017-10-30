class AttendeeChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :attendees, :status, :attendee_status
  end
end
