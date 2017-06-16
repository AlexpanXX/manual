module Admin::CheckpointsHelper
  def render_reference(checkpoint)
    style = "btn btn-raised btn-info btn-round btn-sm"
    if checkpoint.reference.nil?
      link_to "添加引用", new_admin_checkpoint_reference_path(checkpoint), class: style
    else
      link_to checkpoint.reference.name, edit_admin_checkpoint_reference_path(checkpoint), class: style
    end
  end
end
