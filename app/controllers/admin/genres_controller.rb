class Admin::GenresController < ApplicationController


  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "ジャンル名を入力してください"
    else
      render 'inedex'
 　 end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
      flash[:notice_update] = "ジャンル情報を更新しました！"
    else
      render 'edit'
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end


