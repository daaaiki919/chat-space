class MessagesController < ApplicationController

  before_action :set_view, only: %i(index create)

  def index
    @users = @group.users
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(params[:group_id]) }
        format.json { render json: Message.to_api_json(@message) }
      end
    else
      flash.now[:alert] = 'メッセージの送信に失敗しました'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_view
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user)
  end

end
