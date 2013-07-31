class PostsController < ApplicationController

  before_action :check_current_city

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.city = @current_city
    if @post.save
      redirect_to post_path(@post), flash: { notice: 'Post was successfully created' }
    else
      redirect_to new_post_path, flash: { notice: @post.errors.full_messages } 
    end 
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path, notice: 'Post was successfully updated.'
  	else
  	  render action: 'edit'
  	end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def destroy
    @post.destroy
    session[:post_id] = nil
    redirect_to store_url
  end

  private

  #never allow scary parameters from the internet
  def post_params
    params.require(:post).permit(:title, :body, :price, :location)
  end
end
