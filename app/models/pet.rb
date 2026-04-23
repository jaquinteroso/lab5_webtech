class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments

  validates :name, :owner, :date_of_birth, presence: true
  validates :species, inclusion: { in: %w[dog cat rabbit bird reptile other] }
  validates :weight, numericality: { greater_than: 0 }
  validate :date_of_birth_cannot_be_in_future

  scope :by_species, -> (species) { where(species: species) }

  def date_of_birth_cannot_be_in_future
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end
end
