class User < ApplicationRecord
    has_many :ratings
    has_many :destinations, through: :ratings

    validates :username, uniqueness: true, presence: true
    has_secure_password
end
