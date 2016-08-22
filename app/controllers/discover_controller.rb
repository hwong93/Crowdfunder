class DiscoverController < ApplicationController
  def index
    @projects = if params[:search]
      Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Project.all
    end

    if request.xhr?
      render @projects
    end
  end
end
