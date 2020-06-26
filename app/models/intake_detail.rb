class IntakeDetail < ApplicationRecord
  belongs_to :intake_form
  belongs_to :intake_item
end
