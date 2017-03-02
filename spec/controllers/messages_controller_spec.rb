require 'rails_helper'

describe MessagesController do

  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let!(:message) { build(:message, group_id: group.id) }
  let!(:message_params) { { body: message.body, group_id: message.group_id, user_id: message.user_id } }

  before do
    login_user user
  end

  describe 'GET/POST #set_view' do
    it "@groupが期待される値を持つ" do
      get :index, params: { group_id: group }
      expect(assigns(:group)).to eq group
    end

    it "@messagesが期待される値を持つ" do
      get :index, params: { group_id: group }
      messages = group.messages
      expect(assigns(:messages)).to eq messages
    end
  end

  describe 'GET #index' do
    it "@messageが正しくnewされる値を持つ" do
      get :index, params: { group_id: group }
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "@usersが期待される値を持つ" do
      get :index, params: { group_id: group }
      users = group.users
      expect(assigns(:users)).to eq users
    end

    it "indexのビューに正しく変遷される" do
      get :index, params: { group_id: group }
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context "@messageが保存される時" do

      it "@messageの値が保存される" do
        expect{ post :create, params: { group_id: group, message: message_params } }.to change(Message, :count).by(1)
      end

      it "message#indexのビューに変遷される" do
        post :create, params: { group_id: group, message: message_params }
        expect(response).to redirect_to group_messages_path
      end
    end

    context "@messageが保存されない時" do

      it "@message値が保存されない" do
        expect{ post :create, params: { group_id: group, message: attributes_for(:message, body: "") } }.to change(Message, :count).by(0)
      end

      it "message#indexのビューに変遷される" do
        post :create, params: { group_id: group, message: attributes_for(:message, body: "") }
        expect(response).to render_template :index
      end

      it "alertを呼び出せるか" do
        post :create, params: { group_id: group, message: attributes_for(:message, body: "") }
        expect(flash[:alert]).to include("メッセージの送信に失敗しました")
      end
    end
  end
end
