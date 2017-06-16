class Admin::CheckpointsController < Admin::AdminController
  before_action :find_mission_by_id
  before_action :find_checkpoint_by_id, except: [:new, :create]

  def new
    @checkpoint = Checkpoint.new
  end

  def create
    @checkpoint = @mission.checkpoints.build(checkpoint_params)
    if @checkpoint.save
      redirect_to admin_mission_path(@mission), notice: "检查点#{@checkpoint.name}保存成功"
    else
      render :new
    end
  end

  def update
    if @checkpoint.update(checkpoint_params)
      redirect_to admin_mission_path(@mission), notice: "检查点#{@checkpoint.name}已更新"
    else
      render :edit
    end
  end

  def destroy
    @checkpoint.destroy
    redirect_to admin_mission_path(@mission), alert: "检查点#{@checkpoint.name}已删除"
  end

  private

  def find_checkpoint_by_id
    @checkpoint = Checkpoint.find(params[:id])
  end

  def find_mission_by_id
    @mission = Mission.find(params[:mission_id])
  end

  def checkpoint_params
    params.require(:checkpoint).permit(:name, :is_text)
  end
end
