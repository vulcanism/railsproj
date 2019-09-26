class Observation < ApplicationRecord
    belongs_to :user
    belongs_to :cryptid, optional: true

    has_many :comments
    
    validates :date, presence: true
end