class GroupsController < ApplicationController

  def new
    @group = Group.new
    @users = User.where.not(id: current_user)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
     if current_user.name
        @group.save
        redirect_to root_path, notice: '新しいグループを作成しました'
    else
      flash[:alert] = 'グループ作成に失敗しました'
      render new_group_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
