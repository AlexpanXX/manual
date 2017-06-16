class Admin::ReferencesController < Admin::AdminController
  before_action :find_checkpoint_by_id
  before_action :find_reference_by_id, except: [:new, :create]

  def new
    @reference = Reference.new
  end

  def create
    @reference = Reference.new(reference_params)
    @reference.checkpoint = @checkpoint
    if @reference.save
      redirect_to admin_mission_path(@checkpoint.mission), notice: "引用#{@reference.name}保存成功"
    else
      render :new
    end
  end

  def update
    if @reference.update(reference_params)
      redirect_to admin_mission_path(@checkpoint.mission), notice: "引用#{@reference.name}已更新"
    else
      render :edit
    end
  end

  def destroy
    @reference.destroy
    redirect_to admin_mission_path(@checkpoint.mission), alert: "引用#{@reference.name}已删除"
  end

  private

  def find_reference_by_id
    @reference = Reference.find(params[:id])
  end

  def find_checkpoint_by_id
    @checkpoint = Checkpoint.find(params[:checkpoint_id])
  end

  def reference_params
    params.require(:reference).permit(:name, :url)
  end
end
