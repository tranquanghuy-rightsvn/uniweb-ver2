class MapImagesController < ApplicationController
  def update
    map_image = MapImage.find_by(id: params[:id])
    map_image.update! image: params[:map_image][:image]

    flash[:success] = "Cập nhật thành công"
    redirect_to website_images_path(map_image.website_id)
  end
end
