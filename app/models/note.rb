class Note < ApplicationRecord
  belongs_to :annotatable, polymorphic: true
end
