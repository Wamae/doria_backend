class Incident < ApplicationRecord
  belongs_to :user
  belongs_to :incident_type
end
