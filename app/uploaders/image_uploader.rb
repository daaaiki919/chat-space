# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::RMagick

  # 画像の上限を200pxにする
  process :resize_to_limit => [200, 200]

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
