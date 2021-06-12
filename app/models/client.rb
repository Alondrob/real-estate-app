class Client < ApplicationRecord
    validates  :first_name, :last_name,  :email,   presence: true    
    belongs_to :user
    has_many :tours

    def client_name
        "#{first_name} #{last_name}"
    end

    def info
        "#{client_name}, #{email}, #{phone_number}"
    end
end