class CategoriesController < ApplicationController
  before_action :check_owner_website

  def create
    @category = Category.new(category_params.merge(website_id: params[:website_id], editable: true))
    @category.save

    redirect_to website_categories_path(website_id: params[:website_id])
  end

  def index
    @category = Category.new
    @categories = Category.where(website_id: params[:website_id]).order(id: :desc)
  end

  def destroy
    @category.find_by(id: params[:id])

    redirect_to website_products_path(website_id: params[:website_id])
  end

  private

  def category_params
    params.require(:category).permit :name, :category_type
  end
end
