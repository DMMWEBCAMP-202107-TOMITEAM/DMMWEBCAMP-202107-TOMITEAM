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
    if @item.save
      flash[:notice] = "新商品登録完了"
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end


  def edit
    @item = Item.find(params[:id])
  end



  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
       reder :edit
    end
  end


 private

   def item_params
     params.require(:item).permit(:name, :image, :introduction,
         :genre_id, :price, :sale_status)
   end

   def set_genres
      @genres = Genre.where(is_valid: true)
   end





end

