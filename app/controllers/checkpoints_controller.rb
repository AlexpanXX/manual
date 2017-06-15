class CheckpointsController < ApplicationController
  before_action :authenticate_user!, except: :index

  private

  def checkpoint_params
    params.require(:checkpoint).permit(:name, :checked, :text, :section_id)
  end
end
