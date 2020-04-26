class ToppagesController < ApplicationController
  def index
    if logged_in?
      @post = current_user.posts.build
      @posts = Post.order(id: :desc).page(params[:page]).per(25)
    end 
  end
end
