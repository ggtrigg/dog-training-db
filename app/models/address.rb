class Address < ApplicationRecord
  belongs_to :client
  after_initialize :init
  after_validation :check_state
  
  validates :client, presence: true
  validates :postcode, format: { with: /\A\d{4}\Z/, message: "Must be four digits" }, allow_blank: true
  
  private
    def init
      self.state ||= 'Victoria'
      self.country ||= 'Australia'
    end

    def check_state
      if self.postcode.present?
        self.state = case self.postcode[0].to_i
        when 0
          'Northern Territory'
        when 2
          'New South Wales'
        when 4
          'Queensland'
        when 5
          'South Australia'
        when 6
          'Western Australia'
        when 7
          'Tasmania'
        end
      end
    end
end
