class RelationshipsController < ApplicationController

	def show_follow
		@user = User.find(params[:id])
	end

	def show_follower
		@user = User.find(params[:id])
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
