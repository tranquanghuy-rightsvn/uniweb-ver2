class Superadmin::WebsitesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_superadmin

  def index
    @websites = Website.all
  end

  # def reset
  #   @website = Website.find_by id: params[:id]
  #   @website.repo_website.destroy!
  # end

  private

  def check_superadmin
    return redirect_to root_path unless current_user.super_admin?
  end
end
