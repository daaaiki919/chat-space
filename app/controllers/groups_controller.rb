class GroupsController < ApplicationController


  def new
    @group = Group.new
    @users = User.where.not(id: current_user.id)
  end

  def create
    @group = Group.new(group_params)
     if @group.save
      redirect_to root_path, notice: '新しいグループを作成しました'
    else
      render :new
    end
    end


  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
