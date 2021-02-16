class CitizenUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  version :thumb do
    process resize_to_fit: [100,100]
  end

  version :medium do
    process resize_to_fit: [300,300]
  end

  version :large do
    process resize_to_fit: [800,800]
  end
end
