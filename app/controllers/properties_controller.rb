class PropertiesController < ApplicationController
    
    def new
        @property = Property.new
    end

    def create
        property = Property.new(property_params)
        if property.save
            redirect_to properties_path
        else
            redirect_to new_property_path
        end
    end

    def index
        @properties = Property.all
    end

      # strong params
    def client_params
        params.require(:client).permit(:email, :first_name, :last_name, :phone_number,
                                       :annual_income, :credit_score, :property_size,
                                       :min_price, :max_price, :neighborhood, :guarantor)
    end


end