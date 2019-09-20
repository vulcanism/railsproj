class Observation < ApplicationRecord
    belongs_to :user
    belongs_to :cryptid
    
    validates :date, presence: true
end