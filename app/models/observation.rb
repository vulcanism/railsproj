class Observation < ApplicationRecord
    belongs_to :user
    belongs_to :cryptid    
end