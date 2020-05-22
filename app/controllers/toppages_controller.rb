class ToppagesController < ApplicationController
  def index
    @post = current_user.posts.build if logged_in?

    if (params[:prefecture_key])
      @posts = Post.order(id: :desc).page(params[:page]).per(25).search_prefecture(params[:prefecture_key])
    else
      @posts = Post.order(id: :desc).page(params[:page]).per(25).search(params[:content_key])
    end
    
    counts(@posts)
  end
  
  private  
      
  def counts(posts)
    @count_posts = posts.count
  end
end
  

