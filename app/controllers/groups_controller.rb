class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @users = User.where.not(id: current_user)
  end

  def create
    @group = Group.new(group_params)
     if @group.save
        redirect_to root_path, notice: '新しいグループを作成しました'
    else
      flash[:alert] = 'グループ作成に失敗しました'
      render new_group_path
    end
  end

   def edit
    @group = Group.includes(:users).find(params[:id])
   end

   def update
   end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
