class Event < ApplicationRecord
  has_many :attendees, dependent: :destroy
  has_many :clients, through: :attendees, dependent: :destroy
  after_initialize :init

  enum event_type: [:private_lesson, :group_lesson, :emmett_therapy, :trick_training, :xmas_party]
  
  validates :date, presence: true
  validates :location, presence: true
  validates :event_type, presence: true
  validates :price, presence: true
  validates :duration, presence: true
  #~ :event_type, :location, :price, :date, :duration
  
  accepts_nested_attributes_for :attendees, allow_destroy: true
  accepts_nested_attributes_for :clients, allow_destroy: true
  
  private
    def init
      self.cancelled ||= false
    end
end
