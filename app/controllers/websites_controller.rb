class WebsitesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_owner_website, except: :new

  layout "new_website", only: :new

  def analytic
    render :analytic
  end

  def new
  end

  def show
    @website = Website.find_by(params[:id])
  end

  def update
    @website = Website.find_by(params[:id])

    if @website.update params_website
      @website.update params_website

      flash[:success] = "Cập nhật thành công"
      redirect_to website_path(@website)
    else
      render :show
    end
  end

  private

  def params_website
    params.require(:website).permit :logo, :icon
  end
end
