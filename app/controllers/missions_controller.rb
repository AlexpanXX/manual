class MissionsController < ApplicationController
  
  def show
    @mission = Mission.find(params[:id])
    @checkpoints = @mission.checkpoints
  end
end
