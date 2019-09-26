class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :observation

    validates :content, presence: true

end