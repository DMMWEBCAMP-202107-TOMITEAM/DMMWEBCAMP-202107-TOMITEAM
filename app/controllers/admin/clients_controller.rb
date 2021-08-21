class Admin::ClientsController < ApplicationController
  def index
    @clients = Client.page(params[:page])
  end

  def show
    @client = Client.find(params[:id])

  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to admin_client_path(@client)
      flash[:notice_update] = "顧客情報を更新しました！"
    else
      edit_admin_client_path(@client)
    end
  end

 private
  def client_params
    params.require(:client).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :telephone_number, )
  end

end
