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
        @properties = current_user.properties
    end

    def show
        @property = Property.find(params[:id])
    end

    def edit
        @property = current_user.properties.find(params[:id])
    end

  
    def update
        property = Property.find(params[:id])
        if property.update(property_params)
            redirect_to property_path(property)
        else
            redirect_to edit_property_path(property)
        end 
    end

    def all_properties
        @properties = Property.all
    end

    def destroy
        property = Property.find(params[:id])
        property.destroy
        redirect_to properties_path
    end

    
    

      # strong params
    def property_params
        params.require(:property).permit(:management, :address, :unit_number, :size,
                                       :neighborhood, :status, :price,
                                       :floor, :notes, :user_id)
    end


end