class Incident < ApplicationRecord
  belongs_to :user
  belongs_to :incident_type

  validates :location, presence: true
  validates :description, presence: true
end
