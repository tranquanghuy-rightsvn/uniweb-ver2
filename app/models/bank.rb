class Bank < ApplicationRecord
  mount_uploader :qr_code, QrCodeUploader

  belongs_to :store
end
