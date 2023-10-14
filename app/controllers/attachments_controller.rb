require "mini_magick"

class AttachmentsController < ApplicationController
  def resize
    image = MiniMagick::Image.read(params[:file])

    # Thực hiện các thao tác resize ảnh bằng MiniMagick
    image.resize "200x200"  # Thay đổi kích thước ảnh thành 200x200

    # Lưu ảnh đã resize và trả về đường dẫn mới
    temp_file = Tempfile.new(["resized_image", ".png"])
    image.write(temp_file.path)


    render json: { url: temp_file.path, width: image.width, height: image.height }
  end
end
