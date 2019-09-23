# frozen_string_literal: true

class ForumsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show]

  def index
    @forum = Forum.paginate(page: params[:page], per_page: 6)
  end

  def new
    @new_forum = Forum.new
  end

  def create
    @user = current_user.id
    @new_forum = Forum.new('topic' => params[:topic], 'description' => params[:description], 'user_id' => @user)
    if @new_forum.save
      redirect_to forum_path(@new_forum), notice: 'Forum bien créé'
    else
      render 'new', notice: "Vous n'avez pas tout complété"
    end
  end

  def show
    @forum = Forum.find(params[:id])
    @comments = Comment.where(forum_id: @forum).order('created_at DESC')
  end
end
