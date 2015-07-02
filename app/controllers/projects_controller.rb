class ProjectsController < ApplicationController
  def new
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new
  end
  
  def show
    @project = Project.find(params[:id])
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project successfully added!"
      redirect_to skill_path(@project.skill)
    else
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to skills_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to skills_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :git_url, :skill_id)
  end
end
