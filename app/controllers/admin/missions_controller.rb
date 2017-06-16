class Admin::MissionsController < Admin::AdminController
  before_action :find_mission_by_id, only: [:show, :edit, :update, :destroy]
  before_action :find_sections, only: [:new, :edit, :create, :update]

  def index
    @missions = Mission.all
  end

  def new
    @mission = Mission.new
  end

  def show
    @checkpoints = @mission.checkpoints
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      flash[:notice] = "章节#{@mission.name}保存成功"
      redirect_back fallback_location: admin_missions_path
    else
      render :new
    end
  end

  def update
    if @mission.update(mission_params)
      flash[:notice] = "章节#{@mission.name}已更新"
      redirect_back fallback_location: admin_missions_path
    else
      render :edit
    end
  end

  def destroy
    @mission.destroy
    flash[:alert] = "章节#{@mission.name}已删除"
    redirect_back fallback_location: admin_missions_path
  end

  private

  def find_mission_by_id
    @mission = Mission.find(params[:id])
  end

  def find_sections
    @sections = Section.all
  end

  def mission_params
    params.require(:mission).permit(:name, :description, :section_id)
  end
end
