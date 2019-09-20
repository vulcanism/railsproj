class Observation < ApplicationRecord
    belongs_to :user
    belongs_to :cryptid, optional: true
    
    validates :date, presence: true
end