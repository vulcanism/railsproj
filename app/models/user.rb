class User < ApplicationRecord
    has_secure_password

    has_many :observations
    has_many :cryptids, through: :observations
    has_many :comments

    validates :username, :email, :password, presence: true
    validates :username, uniqueness: true
    validates :password, length: { in: 3..15 }

end