class Admin::SectionsController < Admin::AdminController
  before_action :find_section_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "章节#{@section.name}保存成功"
      redirect_back fallback_location: admin_sections_path
    else
      render :new
    end
  end

  def update
    if @section.update(section_params)
      flash[:notice] = "章节#{@section.name}已更新"
      redirect_back fallback_location: admin_sections_path
    else
      render :edit
    end
  end

  def destroy
    @section.destroy
    flash[:alert] = "章节#{@section.name}已删除"
    redirect_back fallback_location: admin_sections_path
  end

  private

  def find_section_by_id
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:name, :description)
  end
end
