class GroupsController < ApplicationController

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
     if @group.save
      flash[:notice] = '新しいグループを作成しました'
    else
      render :new
    end
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
