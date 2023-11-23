class ProductsController < ApplicationController
  before_action :check_manage_website, :load_website
  before_action :load_product, only: [:show, :create, :edit, :update, :destroy]

  def new
    @product = Product.new
    @product.product_images.new
  end

  def create
    @product = Product.new product_params.merge(website_id: params[:website_id])
    if @product.save
      redirect_to website_products_path(website_id: params[:website_id])
    else
      @product.product_images.new
      render :new
    end
  end

  def index
    @products = Product.where(website_id: params[:website_id])
  end

  def show
  end

  def edit
  end

  def update
    if @product.update product_update_params
      redirect_to website_products_path(website_id: params[:website_id])
    else
      render :edit
    end
  end


  def destroy
    @product.destroy!

    redirect_to website_products_path(website_id: params[:website_id])
  end

  private

  def product_params
    params.require(:product).permit :title, :description, :price, :url, :refer_ids, :content, :category_id, :keywords, product_images_attributes: [:image]
  end

  def product_update_params
    params.require(:product).permit :title, :description, :price, :refer_ids, :content, :category_id, :keywords, product_images_attributes: [:image]
  end

  def load_product
    @product = Product.find_by(website_id: params[:website_id], id: params[:id])
  end

  def load_website
    @website = Website.find_by id: params[:website_id]
  end
end
