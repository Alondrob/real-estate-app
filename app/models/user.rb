class User < ApplicationRecord
    has_secure_password
    validates :email, :first_name, :last_name,  presence: true
    validates_uniqueness_of :email
    has_many :clients, dependent: :destroy
    has_many :properties
    belongs_to :admin, required: false 
    
    accepts_nested_attributes_for :properties
    
    scope :by_first_name, -> { order(first_name: :asc) }

    

    def name
        "#{first_name} #{last_name}"
    end

    def my_clients
        @user.clients
    end

    def self.from_omniauth(auth)
        User.where(email: auth["info"]["email"]).first_or_initialize do |user|
            user.email = auth["info"]["email"]
            user.first_name = auth["info"]["first_name"] 
            user.last_name = auth["info"]["last_name"]
            user.password = SecureRandom.hex
        end
       
    end
    # belongs_to :admin
end