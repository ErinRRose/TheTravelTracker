class User < ApplicationRecord
    has_many :ratings
    has_many :destinations, through: :ratings

    validates :email, uniqueness: true, presence: true
    has_secure_password
end
