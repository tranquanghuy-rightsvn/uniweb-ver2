class WebsitesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_owner_website, except: [:new, :analytic, :general, :images, :domain]
  before_action :check_owner_website_id, only: [:analytic, :general, :images, :domain]

  layout "new_website", only: :new

  def analytic
    @website = Website.find_by(id: params[:website_id])
    render :analytic
  end

  def general
    @website = Website.find_by(id: params[:website_id])
  end

  def images
    @website = Website.find_by(id: params[:website_id])
  end

  def domain
    @website = Website.find_by(id: params[:website_id])
  end

  def new
  end

  def show
    @website = Website.find_by(id: params[:id])
  end

  def update
    @website = Website.find_by(id: params[:id])

    if @website.update params_website
      @website.update params_website

      flash[:success] = "Cập nhật thành công"
      redirect_to website_general_path(@website)
    else
      render :general
    end
  end

  private

  def params_website
    params.require(:website).permit :logo, :icon, :title, :description
  end
end
