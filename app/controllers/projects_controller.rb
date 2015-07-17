class ProjectsController < ApplicationController
  def new
    @skill = Skill.find(params[:skill_id])
    if current_user
      if current_user.admin?
        @project = @skill.projects.new
      else
        flash[:notice] = "You must be an administrator to add a project!"
        redirect_to skill_path(@skill)
      end
    else
      flash[:notice] = "You must be logged in and an administrator to add a project!"
      redirect_to skill_path(@skill)
    end
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
    if current_user
      if current_user.admin?
        @skill = Skill.find(params[:skill_id])
        @project = Project.find(params[:id])
      else
        flash[:notice] = "You must be an administrator to edit a project!"
        redirect_to skill_path(@skill)
      end
    else
      flash[:notice] = "You must be logged in and an administrator to edit a project!"
      redirect_to skill_path(@skill)
    end
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
