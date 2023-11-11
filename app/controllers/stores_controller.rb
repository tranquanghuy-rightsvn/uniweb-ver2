class StoresController < ApplicationController
  before_action :check_owner_website_id

  def update_store
    @website = Website.find_by(id: params[:website_id])

    @store = @website.store

    if @store.update params_store
      flash[:success] = "Cập nhật thành công"

      redirect_to website_store_path(website_id: @website.id)
    end
  end

  private

  def params_store
    params.require(:store).permit :provinces, :inner_province, :outer_province
  end
end
