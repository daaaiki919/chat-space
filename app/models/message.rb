class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :body, presence: true

  def time
    created_at.strftime("%Y/%m/%d %H:%M:%S")
  end

  def self.to_api_json(message)
    {
      name: message.user.name,
      time: message.time,
      body: message.body
    }
  end
end
