class Client < ApplicationRecord
    validates  :first_name,  presence: true    
    belongs_to :user

    def client_name
        "#{first_name} #{last_name}"
    end
end