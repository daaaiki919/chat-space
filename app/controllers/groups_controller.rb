class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
     if @group.save
      flash[:notice] = '新しいグループを作成しました'
    else
      flash[:alert] = 'グループの作成に失敗しました'
    end
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
