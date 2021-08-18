class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
  end


  def new
    @item = Item.new
  end


  def show
    @item = Item.find(params[:id])
  end


  def create
    @item = Item.new(item_params)
    if @product.save
      flash[:notice] = "新商品登録完了"
      redirect_to admin_item_path(@product)
    else
      render :new
    end
  end


end


