class Event < ApplicationRecord
  has_many :attendees, dependent: :destroy
  has_many :clients, through: :attendees, dependent: :destroy
  after_initialize :init

  enum event_type: [:private_lesson, :group_lesson, :emmett_therapy, :trick_training]
  
  validates :date, presence: true
  validates :location, presence: true
  
  accepts_nested_attributes_for :attendees, allow_destroy: true
  accepts_nested_attributes_for :clients, allow_destroy: true

  
  private
    def init
      self.cancelled ||= false
    end
end
