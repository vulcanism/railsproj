class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :cryptid

    validates :content, presence: true

end