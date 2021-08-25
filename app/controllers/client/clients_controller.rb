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
     redirect_to clients_my_page_path(current_client)
  end

  def check
    @client = current_client
  end

  def out
    @client = current_client
    @client.update(client_status: true)
    reset_session
    redirect_to root_path
  end

  private

  def client_params
    params.require(:client).permit(:last_name,:first_name,:kana_last_name,:kana_first_name,:postal_code,:address,:telephone_number,:email)
  end

end
