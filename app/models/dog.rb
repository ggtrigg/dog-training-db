class Dog < ApplicationRecord
  has_many :notes, as: :annotatable, dependent: :destroy
  has_one :intake_form, dependent: :destroy
  has_many_attached :documents
  belongs_to :client

  after_create :add_intake_form
  
  enum sex: [:male, :female]
  
  validates :name, presence: true
  validates :breed, presence: true

  accepts_nested_attributes_for :intake_form

  SERVICES = [:daycare, :doggy_holiday, :trust_technique]

  def services_a
    read_attribute(:services) ? JSON.parse(read_attribute(:services)).filter(&:present?) : []
  end

  def describe(do_html = false)
    notstr = 'not '
    if do_html
      notstr = '<span class="text-danger">' + notstr.strip + '</span> '
    end
    sprintf("a %.1f year old %s %sdesexed %s", self.age ? self.age : 0, self.sex, self.desexed ? '' : notstr, self.breed)
  end

  private
    def add_intake_form
      self.create_intake_form
    end
end
