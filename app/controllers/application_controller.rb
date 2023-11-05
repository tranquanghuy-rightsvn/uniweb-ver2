class ApplicationController < ActionController::Base
  def check_manage_website
    unless current_user && current_user.can_manage_website?(params[:website_id])
      flash[:danger] = "Không phải phận sự của bạn"
      redirect_to root_path
    end
  end

  def check_owner_website
    unless current_user && current_user.is_own_website?(params[:id])
      flash[:danger] = "Bạn không có quyền"
      redirect_to root_path
    end
  end

  def check_owner_website_id
    unless current_user && current_user.is_own_website?(params[:website_id])
      flash[:danger] = "Bạn không có quyền"
      redirect_to root_path
    end
  end
end
