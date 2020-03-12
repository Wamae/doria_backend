class IncidentType < ApplicationRecord
  include ActiveModel::Serializers::JSON
  has_many :incident

  validates :name, presence: true, uniqueness: true
end
