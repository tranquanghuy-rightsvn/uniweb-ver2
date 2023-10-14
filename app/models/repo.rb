class Repo < ApplicationRecord
  has_one :repo_website
  has_one :website, through: :repo_website

  scope :available, -> { where(is_available: true)}
end
