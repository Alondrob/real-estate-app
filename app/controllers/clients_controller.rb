class ClientsController < ApplicationController
    
    def new
        @client = Client.new
    end

    def create
        client = Client.new(client_params)
        client.user = current_user 
        if client.save
            redirect_to clients_path
        else
            redirect_to new_client_path
        end
    end

    def index
        @clients = current_user.clients
    end

      # strong params
    def client_params
        params.require(:client).permit(:email, :first_name, :last_name, :phone_number,
                                       :annual_income, :credit_score, :property_size,
                                       :min_price, :max_price, :neighborhood, :guarantor)
    end


end