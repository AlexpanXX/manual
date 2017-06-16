module MissionsHelper
  def render_checkpoint_checked(checkpoint)
    if current_user && current_user.cleared?(checkpoint)
      true
    else
      false
    end
  end

  def render_checkpoint_text(checkpoint)
    current_user && current_user.checkpoint_text(checkpoint)
  end
end
