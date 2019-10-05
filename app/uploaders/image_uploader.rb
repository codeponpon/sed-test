class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :aws

  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_limit => [200, 200]
  end

  def download_url(filename)
    url(response_content_disposition: %Q{attachment; filename="#{filename}"})
  end
end