module SectionsHelper
  def render_mission_start_btn(mission)
    if current_user
      if current_user.mission_cleared?(mission)
        link_to "任务完成", mission_path(mission), class: "btn btn-success btn-raised btn-sm"
      elsif current_user.can_start_mission?(mission)
        link_to "开始任务", mission_path(mission), class: "btn btn-info btn-raised btn-sm"
      else
        link_to "开始任务", "", class: "btn btn-info btn-raised btn-sm disabled"
      end
    else
      link_to "开始任务", mission_path(mission), class: "btn btn-info btn-raised btn-sm"
    end
  end
end
