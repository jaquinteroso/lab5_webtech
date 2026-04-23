class Vet < ApplicationRecord
  has_many :appointments

  validates :first_name, :last_name, :specialization, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :by_specialization, ->(specialization) { where(specialization: specialization) }
end
