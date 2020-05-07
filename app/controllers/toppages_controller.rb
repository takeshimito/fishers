class ToppagesController < ApplicationController
  def index
    @post = current_user.posts.build if logged_in?
    if (params[:prefecture_key])
      @posts = Post.order(id: :desc).page(params[:page]).per(25).search(params[:content_key]).search_prefecture(params[:prefecture_key])
    else
      @posts = Post.order(id: :desc).page(params[:page]).per(25).search(params[:content_key])
    end
  end
  
  
end
