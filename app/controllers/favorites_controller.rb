class FavoritesController < ApplicationController

	def create
		favorite = current_user.favorites.build(book_id: params[:book_id])
		favorite.save
		@book = Book.find_by(id: favorite.book_id)
		@favorite_count = Favorite.where(book_id: params[:book_id]).count

		if params[:iine] == "index"
			redirect_to books_path
		else params[:iine] == "show"
			redirect_to book_path(params[:book_id])
		end
	end

	def destroy
		favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
		@book = Book.find_by(id: favorite.book_id)
		favorite.destroy
		@favorite_count = Favorite.where(book_id: params[:book_id]).count

		if params[:iine] == "index"
			redirect_to books_path
		else params[:iine] == "show"
			redirect_to book_path(params[:book_id])
		end
	end

end
