class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :like]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page]).per(25)
    @likes = @user.favorite_posts.order(id: :desc).page(params[:page]).per(25)
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザー登録しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = '正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
 
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'アカウントの削除が完了しました'
    redirect_to root_url
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.favorite_posts.order(id: :desc).page(params[:page]).per(25)
    counts(@user)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :twitter, :content)
  end
  
  def counts(user)
    @count_posts = user.posts.count
    @count_likes = user.favorite_posts.count
  end
  
end