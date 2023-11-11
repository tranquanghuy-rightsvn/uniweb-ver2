module Api
  class OrdersController < ApiBaseController
    def create
      website_id = eval(Encrypt.decrypt(params["data-website"]))[:website_id]
      resources = eval(Encrypt.decrypt(params["data-website"]))[:resources]

      return {} if resources.exclude?("product")
      store = Store.find_by website_id: website_id

      order_info = params["order_info"]
      order = Order.new(order_code: order_info[:order_code], store_id: store.id, province: order_info[:province], address: order_info[:address], phone_number: order_info[:phone_number])

      total_price = 0

      if JSON.parse(store.provinces).include?(order_info[:province])
        total_price += store.inner_province
      else
        total_price += store.outer_province
      end

      JSON.parse(order_info[:order_products]).map do |item|
        product_id = JSON.parse(Encrypt.decrypt(item["product_id"]))["product_id"]
        product = Product.find product_id

        return raise Exception.new("Lỗi") if product.website_id != website_id
        total_price += product.price

        order.order_products.new product_id: product_id, quantity: item["quantity"]
      end

      order.total_price = total_price

      if order.save
        render json: { status: 200, message: 'Đặt hàng thành công', data: { order: order} }
      else
        render json: { status: 400, message: 'Có lỗi'}
      end
    end
  end
end
