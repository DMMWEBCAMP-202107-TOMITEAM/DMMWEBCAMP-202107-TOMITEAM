class Client::ClientsController < ApplicationController
  def show
    @client = current_client
  end

  def edit
    @client = current_client
  end

  def update
     @client = current_client
     @client.update(client_params)
     redirect_to client_path(@client.id)
  end

  def check
    @client = current_client
  end

  def out
  end


  private

  def client_params
    params.require(:client).permit(:name)
  end

end
