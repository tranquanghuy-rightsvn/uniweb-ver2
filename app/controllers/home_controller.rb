class HomeController < ApplicationController
  before_action :check_login?

  def index
    website = current_user.websites.find{ |website| current_user.is_own_website?(website.id)}

    if website
      redirect_to analytic_website_path(website.id)
    else
      website = current_user.websites.find{ |website| !current_user.is_own_website?(website.id)}

      return redirect_to website_products_path(website_id: website.id) if website
    end
  end

  private

  def check_login?
    redirect_to(new_user_session_path) unless current_user
  end
end
