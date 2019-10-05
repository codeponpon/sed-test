class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :aws

  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end
end