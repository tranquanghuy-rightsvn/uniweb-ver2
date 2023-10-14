class RepoWebsite < ApplicationRecord
  belongs_to :repo
  belongs_to :website

  after_create :change_status_for_repo

  def change_status_for_repo
    repo.update! is_available: false
  end
end
