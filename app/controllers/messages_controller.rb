class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @users = @group.users
  end

  def time
    strftime("%Y/%m/%d %H:%M:%S")
  end

end
