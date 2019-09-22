class Cryptid < ApplicationRecord
    has_many :observations
    has_many :users, through: :observations

    validates :name, presence: true

    scope :order_by_location, -> {order(location: :asc)}
end