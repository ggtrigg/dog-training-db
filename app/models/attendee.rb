class Attendee < ApplicationRecord
  belongs_to :client, :inverse_of => :attendees
  belongs_to :event, :inverse_of => :attendees
  
  after_initialize :init
  
  enum attendee_status: [:pending, :completed, :cancelled]
  
  accepts_nested_attributes_for :client, allow_destroy: true
  accepts_nested_attributes_for :event, allow_destroy: true
  
  def html_status
    if self.attendee_status == "completed"
      '<span class="text-success">' + self.attendee_status + '</span>'
    elsif self.attendee_status == "cancelled"
      '<span class="text-danger">' + self.attendee_status + '</span>'
    else
      self.attendee_status
    end
  end
  
  private
    def init
      self.attendee_status ||= "pending"
    end
end
