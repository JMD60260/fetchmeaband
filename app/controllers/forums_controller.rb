class ForumsController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show]
	def index
		@forum = Forum.all
	end

	def new
		@new_forum = Forum.new
	end

	def create
		@user = current_user.id
		@new_forum = Forum.new('topic' => params[:topic], 'description' => params[:description], 'user_id' => @user)
		if @new_forum.save
			redirect_to forum_path(@new_forum)
		else
			render 'new'
		end
	end

	def show
		@forum = Forum.find(params[:id])
		@comments = Comment.where(forum_id: @forum).order("created_at DESC")
	end
end