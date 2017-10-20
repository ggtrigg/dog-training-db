class Client < ApplicationRecord
  has_many :dogs, dependent: :destroy
  has_many :notes, as: :annotatable, dependent: :destroy
  has_one :address, dependent: :destroy
  validates :surname, presence: true
  accepts_nested_attributes_for :address, allow_destroy: true
end
