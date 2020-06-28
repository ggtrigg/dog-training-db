class Dog < ApplicationRecord
  has_many :notes, as: :annotatable, dependent: :destroy
  has_one :intake_form, dependent: :destroy
  has_many_attached :documents
  belongs_to :client

  after_create :add_intake_form
  before_save :calculate_dob, if: Proc.new {|dog| dog.changed_attributes.has_key? 'age' }
  
  enum sex: [:male, :female]
  
  validates :name, presence: true
  validates :breed, presence: true

  accepts_nested_attributes_for :intake_form

  SERVICES = [:daycare, :doggy_holiday, :trust_technique]

  def services_a
    # read_attribute(:services) ? JSON.parse(read_attribute(:services)).filter(&:present?) : []
    read_attribute(:services) ? JSON.parse(read_attribute(:services)) : []
  end

  def describe(do_html = false)
    notstr = 'not '
    if self.dob.present?
      days_alive = Date.current - self.dob
      years = (days_alive / 365).to_i
      months = ((days_alive % 365) / 30).to_i
      year_str = ActionController::Base.helpers.pluralize(years, 'year')
      month_str = ActionController::Base.helpers.pluralize(months, 'month')
      age_str = [year_str, month_str, 'old'].join ' '
    else
      age_str = 'unknown age'
    end
    if do_html
      notstr = '<span class="text-danger">' + notstr.strip + '</span> '
    end
    sprintf("a %s %s %sdesexed %s", age_str, self.sex, self.desexed ? '' : notstr, self.breed)
  end

  def calculate_dob
    now = Date.current
    # Convert the age field into seconds
    case age
    when /\A\d+\.\d+\Z/                                   # 2.4 (years) style
      self.dob = now.years_ago(age.to_f)
    when /\A(\d{1,2})\/(\d{4})\Z/                         # m/yyyy style
      self.dob = Date.new($2.to_i, $1.to_i)
    when /\A(\d{1,2})\/(\d{1,2})\/(\d{4})\Z/              # d/m/yyyy style
      self.dob = Date.new($3.to_i, $2.to_i, $1.to_i)
    when /\A(\d+)y((\d+)m?)?\Z/                           # '2y4m' style
      self.dob = now.years_ago($1.to_f + $3.to_f/12.0)
    end
  end

  private
    def add_intake_form
      self.create_intake_form
    end
end
