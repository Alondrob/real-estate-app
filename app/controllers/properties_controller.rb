class PropertiesController < ApplicationController
    
    def new
        @property = Property.new
    end

    def create
        property = Property.new(property_params)
        property.user = current_user
        if property.save
            redirect_to properties_path
        else
            redirect_to new_property_path
        end
    end

    def index
        @properties = current_user.properties
    end

      # strong params
    def property_params
        params.require(:property).permit(:management, :address, :unit_number, :size,
                                       :neighborhood, :status, :price,
                                       :floor, :notes)
    end


end