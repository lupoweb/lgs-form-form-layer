class Mediation < ApplicationRecord
  belongs_to :user
  validates :mediation_type, presence: true
end