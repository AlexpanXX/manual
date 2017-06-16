module Admin::UsersHelper

  def render_user_type(user)
    user.admin? ? "管理员" : "普通用户"
  end
end
