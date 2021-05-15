class Property < ApplicationRecord
    validates  :management, :address, :size, :neighborhood,
               :status, :floor,  presence: true  
    belongs_to :user 
end