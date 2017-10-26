class Attendee < ApplicationRecord
  belongs_to :client
  belongs_to :event
  after_initialize :init
  
  enum status: [:pending, :completed, :cancelled]
  
  accepts_nested_attributes_for :client, allow_destroy: true
  accepts_nested_attributes_for :event, allow_destroy: true
  
  private
    def init
      self.status = "pending"
    end
end
