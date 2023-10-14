class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {super_admin: 0, admin: 1, normal: 2}

  has_many :user_website_roles
  has_many :websites, through: :user_website_roles

  def can_manage_website? website_id
    UserWebsiteRole.find_by(website_id: website_id, user_id: id).present?
  end

  def is_own_website? website_id
    UserWebsiteRole.find_by(website_id: website_id, user_id: id)&.owner_website? || false
  end

  def role_in_website website_id
    UserWebsiteRole.find_by(website_id: website_id, user_id: id).role
  end
end
