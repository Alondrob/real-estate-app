class ClientsController < ApplicationController
    
    def new
        user = User.find(params[:user_id])
        @client = Client.new(user_id: user.id)
    end

    def create
        @client = Client.new(client_params)
        @client.user_id = current_user.id
        
        if @client.save
            redirect_to clients_path
        else
            render :new 
        end
    end

    def index
        if is_admin?
            @user = current_user.users.find(params[:user_id])
            @clients = @user.clients
        else
         @clients = current_user.clients
        end
    end

    def show  
        @client = current_user.clients.find(params[:id])
    end

    def edit
        @client = Client.find(params[:id])
    end

    def update
        client = Client.find(params[:id])
        if client.update(client_params)
            redirect_to client_path(client)
        else
            redirect_to edit_client_path(client)
        end 
    end


    def destroy 
        # byebug
        client = Client.find(params[:id])
        client.destroy
        redirect_to clients_path
    end

    

      # strong params
    def client_params
        params.require(:client).permit(:email, :first_name, :last_name, :phone_number,
                                       :annual_income, :credit_score, :property_size,
                                       :min_price, :max_price, :neighborhood, :guarantor)
    end


end