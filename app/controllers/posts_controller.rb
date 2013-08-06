class PostsController < ApplicationController

  before_action :check_current_city, :check_user_login, except: [:index]
  # :check_current_subcategory

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = @current_user
    @post.city = @current_city
    @post.subcategory = Subcategory.find(session[:subcategory_id])
    if @post.save
      redirect_to post_path(@post), flash: { notice: 'Post was successfully created' }
    else
      redirect_to new_post_path, flash: { notice: @post.errors.full_messages } 
    end 
  end

  def edit
    @post = Post.find(params[:id])
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
    params.require(:post).permit(:title, :body, :price, :photo, :location, :city_id, :subcategory_id)
  end
end
