class Address < ApplicationRecord
  belongs_to :client
  after_initialize :init
  
  validates :client, presence: true
  validates :postcode, format: { with: /\A\d{4}\Z/, message: "Must be four digits" }, allow_blank: true
  
  def init
    self.state ||= 'Victoria'
    self.country ||= 'Australia'
  end
end
