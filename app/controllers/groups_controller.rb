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
        redirect_to group_messages_path(@group.id), notice: '新しいグループを作成しました'
    else
      flash[:alert] = 'グループ作成に失敗しました'
      render new_group_path
    end
  end

   def edit
    @group = Group.includes(:users).find(params[:id])
   end

   def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group.id), notice: 'グループを更新しました'
    else
      render :edit
    end
   end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
