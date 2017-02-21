class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find_by(params[:group_id])
    @messages = @group.messages
    @users = @group.users
  end

end
