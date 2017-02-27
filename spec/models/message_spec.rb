require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a body, user_id, group_id" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a body" do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください")
    end

    it "is invalid without a group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group_id]).to include()
    end

    it "is invalid without a user_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user_id]).to include()
    end

  describe '#time' do
    it "whether the method returns the expected return value" do
      expect(:created_at).to be_truthy
    end

  end
  end
end
