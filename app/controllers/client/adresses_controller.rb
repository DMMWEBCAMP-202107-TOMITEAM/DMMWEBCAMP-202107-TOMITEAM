class Client::AdressesController < ApplicationController

  def index
    @adress = Adress.new
    @adresses = current_client.adresses
  end

  def edit
    @adress = Adress.find(params[:id])
  end

  def update
    @adress = Adress.find(params[:id])
    @adress.update(adress_params)
    redirect_to adresses_path
  end

  def create
  	@adress = Adress.new(adress_params)
  	@adress.client_id = current_client.id
  	@adress.save
  	redirect_to adresses_path
  end

  def destroy
    @adress = Adress.find(params[:id])
    @adress.destroy
    redirect_to adresses_path
  end

  private

  def adress_params
  	params.require(:adress).permit(:name, :client_id, :adress, :postal_code)
  end

end
