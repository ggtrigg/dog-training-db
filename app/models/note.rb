class Note < ApplicationRecord
  belongs_to :annotatable, polymorphic: true, optional: true
  
  validates :annotation, presence: true
end
