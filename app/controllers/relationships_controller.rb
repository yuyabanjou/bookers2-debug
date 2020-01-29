class RelationshipsController < ApplicationController

	def index
		@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
		@user = current_user
	end

	def follow
		@user = User.find(params[:id])
		current_user.follow(@user,current_user)
		if params[:follow] == "index"
			redirect_to users_path
		else params[:follow] == "show"
			redirect_to user_path(@user)
		end
	end

	def unfollow
		@user = User.find(params[:id])
		current_user.unfollow(@user,current_user)
		if params[:follow] == "index"
			redirect_to users_path
		else params[:follow] == "show"
			redirect_to user_path(@user)
		end
	end

end
