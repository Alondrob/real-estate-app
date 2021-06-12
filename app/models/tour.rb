class Tour < ApplicationRecord
    validates  :time,  presence: true    
    belongs_to :client
    belongs_to :property
end