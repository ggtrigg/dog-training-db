class Client < ApplicationRecord
  has_one :address, inverse_of: :client, dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :notes, as: :annotatable, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :events, through: :attendees, dependent: :destroy
  
  validates :firstname, presence: true
  validates :email_address, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, allow_blank: true
  validates :phone_number, format: {with: /\A[0-9 +]*\z/i}, allow_blank: true
  
  validates_associated :address
  
  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank, update_only: true
  accepts_nested_attributes_for :dogs, reject_if: proc { |attributes| attributes['name'].blank? && attributes['breed'].blank? }
  accepts_nested_attributes_for :notes, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :attendees, allow_destroy: true
  accepts_nested_attributes_for :events, allow_destroy: true, reject_if: :all_blank
  
  scope :name_has, -> (name) { where("(firstname like ?) or (surname like ?)", "%#{name}%", "%#{name}%")}
  
  # Strip spaces & tabs from the phone number so that it's
  # easier to format later.
  def phone_number= (number)
    write_attribute(:phone_number, number.try(:tr, " \t", ''))
  end
  
  # Return client's full name - i.e. first name & surname
  def fullname
    self.firstname + " " + self.surname
  end
  
  # Return a one line description of client
  def describe
    dog_names = []
    self.dogs.each do |d|
      dog_names << d.name
    end
    sprintf("%s %s [%s]", self.firstname, self.surname, dog_names.join(' '))
  end
  
  # Format phone number to (Australian) standard style.
  # e.g. 03 1234 5678, 1234 5678 or 0412 345 678
  # If the number doesn't fit the 8 or 10 digit pattern
  # just return it as is (or '' if nil).
  def phonenum_format
    return '' if self.phone_number.nil?
    a = self.phone_number.try(:scan, /(?:\A(0[1-35-9])?(\d{4})(\d{4})\Z)|(?:\A(04\d{2})(\d{3})(\d{3})\Z)/)
    a.blank? ? self.phone_number : a[0].compact.join(' ')
  end
end
