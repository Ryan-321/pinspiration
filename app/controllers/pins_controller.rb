class PinsController < ApplicationController


  def index
    @posts = User.find(session[:user]["id"]).posts
  end
  def show
    @pin = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @user = User.find(session[:user]["id"])
    @pin = @user.posts.create!(post_params)
    redirect_to post_path(@pin)
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @pin = Pin.find(params[:id])
    @pin.update(post_params)
    redirect_to post_path(@pin)
  end
  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    redirect_to "/" # may need to change this up
  end
  private
  def post_params
        params.require(:pin).permit(:author, :title, :article)
  end


end
