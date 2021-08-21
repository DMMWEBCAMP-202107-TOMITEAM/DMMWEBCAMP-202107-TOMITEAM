class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.order("created_at DESC").page(params[:page]).per(4)
  end

  def about
  end
  
end
