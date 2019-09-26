class User < ApplicationRecord
    has_secure_password

    has_many :observations
    has_many :cryptids, through: :observations
    has_many :comments

    validates :username, :email, :password, presence: true
    validates :username, uniqueness: true
    validates :password, length: { in: 3..15 }

    scope :most_observations, -> { joins(:observations).group(:id).order('count(observations.id) desc').limit(1) }

end