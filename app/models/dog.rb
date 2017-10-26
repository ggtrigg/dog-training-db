class Dog < ApplicationRecord
  has_many :notes, as: :annotatable, dependent: :destroy
  belongs_to :client
  # after_initialize :init
  
  enum sex: [:male, :female]
  
  validates :name, presence: true
  validates :breed, presence: true

  
  def describe(do_html = false)
    notstr = 'not '
    if do_html
      notstr = '<span class="text-danger">' + notstr.strip + '</span> '
    end
    sprintf("a %.1f year old %s %sdesexed %s", self.age ? self.age : 0, self.sex, self.desexed ? '' : notstr, self.breed)
  end
  
  private
    #def init
      #self.desexed ||= true
    #end
end
