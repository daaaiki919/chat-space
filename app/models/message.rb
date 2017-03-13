class Message < ApplicationRecord
  belongs_to :user
  belongs_to :grou
  mount_uploader :image, ImageUploader
  validates :body_image, presence: true

  def time
    created_at.strftime("%Y/%m/%d %H:%M:%S")
  end

  def self.to_api_json(message)
    {
      name: message.user.name,
      time: message.time,
      body: message.body,
      image: message.image.url
    }
  end

private

  def body_image
    body.presence or image.presence
  end

end
