class PostsController < ApplicationController
  before_action :check_manage_website
  before_action :load_post, only: [:show, :create, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params.merge(website_id: params[:website_id])
    if @post.save
      redirect_to website_posts_path(website_id: params[:website_id])
    else
      render :new
    end
  end

  def index
    @posts = Post.where(website_id: params[:website_id])
  end

  def show
  end

  def edit
  end

  def update
    if @post.update post_update_params
      redirect_to website_posts_path(website_id: params[:website_id])
    else
      render :edit
    end
  end


  def destroy
    @post.destroy!

    redirect_to website_posts_path(website_id: params[:website_id])
  end

  private

  def post_params
    params.require(:post).permit :title, :description, :content, :image, :url, :refer_ids, :category_id
  end

  def post_update_params
    params.require(:post).permit :title, :description, :content, :image, :refer_ids, :category_id
  end

  def load_post
    @post = Post.find_by(website_id: params[:website_id], id: params[:id])
  end
end
