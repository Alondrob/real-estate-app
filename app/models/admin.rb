class Admin < ApplicationRecord
    has_secure_password
    validates  :email,  presence: true    
    has_many :users
    has_many :properties, through: :users
    has_many :clients, through: :properties
end