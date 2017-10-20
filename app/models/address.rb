class Address < ApplicationRecord
  belongs_to :client
  after_initialize :init
  
  def init
    self.state ||= 'Victoria'
    self.country ||= 'Australia'
  end
end
