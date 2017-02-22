class GroupsController < ApplicationController

  before_action :set_group, only: %i(edit update)

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
        redirect_to group_messages_path(@group), notice: '新しいグループを作成しました'
    else
      flash.now[:alert] = 'グループ作成に失敗しました'
      render new_group_path
    end
  end

   def edit
   end

   def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group.id), notice: 'グループを更新しました'
    else
      flash.now[:alert] = 'グループの更新に失敗しました'
      render :edit
    end
   end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
