class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, length: {in: 4..20}
    has_many :bookings
    has_many :trips, through: :bookings
  end