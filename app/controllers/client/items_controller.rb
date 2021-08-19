class Client::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def show
    @item = User.find(params[:id])
    @numbers = [0,1,2,3,4,5,6,7,8,9,10]
  end
end