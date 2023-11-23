class Superadmin::ReposController < ApplicationController
  before_action :authenticate_user!
  before_action :check_superadmin

  def index
    @repos = Repo.all
  end

  def new
    @repo = Repo.new
  end

  def create
    @repo = Repo.new params_repo

    if @repo.save
      flash[:success] = "Tạo thành công Repo"
      redirect_to superadmin_repos_path
    else
      render :new
    end
  end

  def update
    @repo = Repo.find_by id: params[:id]
    if @repo.update params_repo_update
      flash[:success] = "Thêm thành công"

      redirect_to edit_superadmin_repo_path(@repo)
    else
      render :edit
    end
  end

  def edit
    @repo = Repo.find_by id: params[:id]
  end

  private

  def params_repo
    params.require(:repo).permit :path, :git_remote
  end

  def params_repo_update
    params.require(:repo).permit :vercel_domain, :git_remote
  end

  def check_superadmin
    return redirect_to root_path unless current_user.super_admin?
  end
end
