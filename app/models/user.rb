class User < ApplicationRecord
    has_secure_password
    validates :email, :first_name, :last_name,  presence: true
    validates_uniqueness_of :email
    has_many :clients
    has_many :properties
    belongs_to :admin
    accepts_nested_attributes_for :clients, reject_if: proc {|attributes| attributes["email"].blank?}
    
    scope :by_first_name, -> { order(first_name: :asc) }

    scope :by_ariel_and_daniel, -> { where(first_name: ["Daniel", "Ariel "]) }

    def name
        "#{first_name} #{last_name}"
    end

    def my_clients
        @user.clients
    end
    # belongs_to :admin
end