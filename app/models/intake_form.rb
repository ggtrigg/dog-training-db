class IntakeForm < ApplicationRecord
  has_many :intake_details, dependent: :destroy
  belongs_to :dog

  after_create :add_details

  accepts_nested_attributes_for :intake_details

  private
    def add_details
      IntakeItem.all.each do |item|
        self.intake_details << item.intake_details.new
      end
    end
end
