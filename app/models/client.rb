class Client < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :notes, as: :annotatable, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :events, through: :attendees, dependent: :destroy
  
  validates :firstname, presence: true
  validates :email_address, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, allow_blank: true
  validates :phone_number, format: {with: /\A[0-9 +]*\z/i}, allow_blank: true
  
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
  
  def fullname
    self.firstname + " " + self.surname
  end
  
  def phonenum_format
    a = self.phone_number.start_with?('04') ?
      self.phone_number.scan(/(04\d{2})(\d{3})(\d{3})/) :
      self.phone_number.scan(/(0[1-35-9])?(\d{4})(\d{4})/)
    a.join ' '
  end
end
