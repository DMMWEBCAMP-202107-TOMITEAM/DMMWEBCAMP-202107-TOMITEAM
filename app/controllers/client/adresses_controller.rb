class Client::AdressesController < ApplicationController
  
  def index
    @adress = Adress.new
  end
  
  def create
  	@adress = Adress.new(adress_params)
  	@adress.client_id = current_client.id
  	@adress.save
  	redirect_to adresses_path
  end
  
  private
  
  def adress_params
  	params.require(:adress).permit(:name, :client_id, :adress, :postal_code)
  end
  
end
