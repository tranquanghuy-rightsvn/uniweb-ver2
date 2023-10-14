ActiveStorage::Blob.class_eval do
  # before_create :resize_image

  # def resize_image
  #   # if image?
  #   #   byebug
  #   #   io = download.open
  #   #   image = MiniMagick::Image.read(io)

  #   #   # Kiểm tra kích thước của ảnh và thực hiện resize nếu cần
  #   #   if image.width > 100 || image.height > 100
  #   #     image.resize "100x100>"
  #   #   end

  #   #   # Lưu ảnh đã được resize
  #   #   self.io = StringIO.new(image.to_blob)
  #   # end
  #   self.metadata = {identified: true, width: 200, analyzed: true}
  # end
end


# alias_method :upload_without_unfurling_orig, :upload_without_unfurling

#   def upload_without_unfurling(io)
#     variant = attachments.first.send(:variants)
#     default_variant = variant[:default]
#     byebug
#     if default_variant
#       ActiveStorage::Variation.wrap(default_variant).transform(io) do |output|
#         image = MiniMagick::Image.read(output)
#         if image.width > 800
#           image.resize "100x100>"
#         end

#         upload_without_unfurling_orig(image.tempfile)
#       end
#     else
#       upload_without_unfurling_orig(io)
#     end
#   end
