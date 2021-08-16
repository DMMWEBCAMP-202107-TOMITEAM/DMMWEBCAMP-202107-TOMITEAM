class ClientsController < ApplicationController
  def show
    @client = Client.find(params[:id])
    
  end
  
  def edit
  end
  
  def update
  end
  
  def check
  end
  
  def out
  end
  
end
