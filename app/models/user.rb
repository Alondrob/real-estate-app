class User < ApplicationRecord
    has_secure_password
    validates :email, :first_name, :last_name,  presence: true
    validates_uniqueness_of :email
    has_many :clients
    has_many :properties
    

    def name
        "#{first_name} #{last_name}"
    end
    # belongs_to :admin
end