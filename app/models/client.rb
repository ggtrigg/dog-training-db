class Client < ApplicationRecord
  has_many :dogs, dependent: :destroy
  validates :surname, presence: true
end
