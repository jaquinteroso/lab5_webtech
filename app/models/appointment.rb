class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :vet

  has_many :treatments

  def status_text
    case status
    when 0 then "Scheduled"
    when 1 then "In Progress"
    when 2 then "Completed"
    when 3 then "Cancelled"
    else "Unknown"
    end
  end
end
