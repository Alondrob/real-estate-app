class Property < ApplicationRecord
    validates  :management, :address, :size, :neighborhood,
               :status, :price, :floor,   presence: true  
    belongs_to :user 

     scope :by_price, -> { order(price: :asc) }
end