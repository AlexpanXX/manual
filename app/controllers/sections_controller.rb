class SectionsController < ApplicationController

  def index

  end

  private

  def current_section
    if current_user
      @section = current_user.current_section
    else
      @section = Section.find_by(id: params[:section] ? params[:section] : 0)
    end
  end
end
