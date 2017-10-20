class Dog < ApplicationRecord
  has_many :notes, as: :annotatable, dependent: :destroy
  belongs_to :client
end
