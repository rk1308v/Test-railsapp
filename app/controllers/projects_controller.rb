class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end
  def show
  	@project = Project.find(params[:id])
  end

  def create
  	 @project = Project.new(project_params)
  	 
    if @project.save
      redirect_to @project
    else
      render :action => 'new'
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(params[:project])
      redirect_to @project
    else
      render :action => 'edit'
    end
  end
  private
   def project_params
     params.require(:project).permit(:name, :text)
   end
end