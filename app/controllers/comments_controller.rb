class CommentsController < ApplicationController
	before_action :find_forum
    before_action :find_comment, only: [:destroy, :edit, :update]
	before_action :authenticate_user!

	def new
	  @comments = Comment.new

	end

	def create
		@comment = @forum.comments.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.save
	if @comment.save
		redirect_to forum_path(params[:forum_id])
	else
		render 'new'
	end
	end

	def edit
	end

	def update
		if @comment.update(params[:comment].permit(:content))
			redirect_to forum_path(params[:forum_id])
		else
			render 'edit'
		end
	end


	private
	def find_forum
	  @forum = Forum.find(params[:forum_id])
	end

	def find_comment
	  @comment = @forum.comments.find(params[:id])
	end

end
