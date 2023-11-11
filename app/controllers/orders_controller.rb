class OrdersController < ApplicationController
  before_action :check_owner_website_id

  def index
    @website = Website.find_by(id: params[:website_id])

    @orders = @website.store.orders.order(id: :desc)
  end

  def show
    @website = Website.find_by(id: params[:website_id])

    @order = @website.store.orders.includes(order_products: :product).find_by(id: params[:id])
  end

  def update
    @website = Website.find_by(id: params[:website_id])

    order = @website.store.orders.includes(order_products: :product).find_by(id: params[:id])

    order.update! status: params[:status].to_sym

    if params[:is_index]
      redirect_to website_orders_path(website_id: params[:website_id])
    else
      redirect_to website_order_path(website_id: params[:website_id], id: params[:id])
    end
  end
end
