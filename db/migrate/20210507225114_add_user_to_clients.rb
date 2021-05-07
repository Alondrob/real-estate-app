class AddUserToClients < ActiveRecord::Migration[6.1]
  def change
    add_reference :clients, :user
  end
end
