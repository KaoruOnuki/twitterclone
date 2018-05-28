class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(howl_id: params[:howl_id])
    redirect_to favorite.howl, notice: "#{favorite.howl.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to favorite.howl, notice: "#{favorite.howl.user.name}さんのブログをお気に入り解除しました"
  end
end
