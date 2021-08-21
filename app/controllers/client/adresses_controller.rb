class Client::AdressesController < ApplicationController

  def index
    @address = Adress.new
    @addresses = current_client.adresses
  end

  def edit
    @address = Adress.find(params[:id])
  end

  def update
    @address = Adress.find(params[:id])
    @address.update(address_params)
    redirect_to adresses_path
  end

  def create
  	@address = Adress.new(address_params)
  	@address.client_id = current_client.id
  	@address.save
  	redirect_to adresses_path
  end

  def destroy
    @address = Adress.find(params[:id])
    @address.destroy
    redirect_to adresses_path
  end

  private

  def address_params
  	params.require(:adress).permit(:name, :client_id, :address, :postal_code)
  end

end
