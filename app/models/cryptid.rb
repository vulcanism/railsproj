class Cryptid < ApplicationRecord
    has_many :observations
    has_many :users, through: :observations

    validates :name, presence: true
end