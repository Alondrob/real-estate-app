class PropertiesController < ApplicationController
    
    def new
        user = User.find(params[:user_id])
        @property = Property.new(user_id: user.id)
    end

    def create
        @property = Property.new(property_params)
       
        if @property.save
            redirect_to properties_path
        else
            render :new
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
        @property = Property.find(params[:id])
        if @property.update(property_params)
            redirect_to property_path(@property)
        else
            render :edit
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
    
    def cheapest
        @property = Property.where.not(price: 0).by_price.limit(2).first
        
    end
    

      # strong params
    def property_params
        params.require(:property).permit(:management, :address, :unit_number, :size,
                                       :neighborhood, :status, :price,
                                       :floor, :notes, :user_id)
    end


end