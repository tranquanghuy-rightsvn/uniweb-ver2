class UsersController < ApplicationController
  before_action :check_manage_website, :load_website
  before_action :load_user, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserWebsiteRole.create(website_id: params[:website_id], user: @user)

      redirect_to website_users_path(website_id: params[:website_id])
    else
      render :new
    end
  end

  def index
    @users = User.left_joins(websites: :user_website_roles).where(user_website_roles: { website_id: params[:website_id] }).distinct.order(id: :desc)
  end


  def destroy
    @user.destroy!

    redirect_to website_products_path(website_id: params[:website_id])
  end

  private

  def user_params
    params.require(:user).permit :email, :password, :password_confirmation
  end

  def load_user
    @user = User.find_by(id: params[:id])
  end

  def load_website
    @website = Website.find_by id: params[:website_id]
  end
end
