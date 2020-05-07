class RankController < ApplicationController
  def index
    @posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  end
end
