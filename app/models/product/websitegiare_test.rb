class WebsitegiareTest < Product
  include EncodeContent

  mount_uploader :image, ProductWebsitegiareUploader
  has_rich_text :content

  before_save :encode_content, if: :content_copied?

  after_create_commit :generate_data
  after_update_commit :update_data
  after_destroy_commit :delete_data

  def time_publish
    created_at.to_s
  end

  private

  def generate_data
    CreateService.new(self).perform
  end

  def update_data
    UpdateService.new(self).perform
  end

  def delete_data
    DeleteService.new(self).perform
  end

  def image_height_greater_than_or_equal_to_width
    if image? && image.height < image.width
      errors.add(:image, "Chiều cao ảnh phải lớn hơn hoặc bằng chiều rộng.")
    end
  end

  def content_copied?
    self.content_copied
  end
end
