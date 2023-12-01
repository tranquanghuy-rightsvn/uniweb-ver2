class WebsitesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_owner_website, except: [:new, :analytic, :general, :images, :domain, :store, :setting_analytic]
  before_action :check_owner_website_id, only: [:analytic, :general, :images, :domain, :store]

  layout "new_website", only: :new

  def analytic
    @website = Website.find_by(id: params[:website_id])
    @google_api_credential = @website.google_api_credential || GoogleApiCredential.new

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
      flash[:success] = "Cập nhật thành công"

      redirect_to website_general_path(@website)
    else
      render :general
    end
  end

  def store
    @website = Website.find_by(id: params[:website_id])

    @store = @website.store
  end

  def setting_analytic
    website = Website.find_by(id: params[:website_id])
    google_api_credential = GoogleApiCredential.create!(
      website_id: website.id,
      project_id: params[:project_id],
      private_key_id: params[:private_key_id],
      private_key: params[:private_key],
      client_email: params[:client_email],
      client_id: params[:client_id],
      property_id: params[:property_id]
    )

    GoogleConsole::AnalyticService.new(
      project_id: google_api_credential.project_id,
      private_key_id: google_api_credential.private_key_id,
      private_key: google_api_credential.private_key,
      client_email: google_api_credential.client_email,
      client_id: google_api_credential.client_id,
      property_id: google_api_credential.property_id,
      id: google_api_credential.id
    ).execute

    flash[:success] = "Cập nhật thành công"

    redirect_to root_path
  end

  private

  def params_website
    params.require(:website).permit :logo, :icon, :title, :description
  end
end
