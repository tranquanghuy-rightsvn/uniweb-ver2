class Repo < ApplicationRecord
  has_one :repo_website
  has_one :website, through: :repo_website

  scope :available, -> { where(is_available: true)}

  after_create_commit :initial_folder

  validate :check_exist_project, on: :create
  validates :git_remote, uniqueness: true, if: :git_remote_present?
  validates :vercel_domain, uniqueness: true, if: :vercel_domain_present?

  private

  def check_exist_project
    errors.add(:path, "đã tồn tại") if File.directory?("#{Rails.root.parent}/projects/#{path}")
  end

  def initial_folder
    Dir.chdir("#{Rails.root.parent}/projects")
    system("mkdir #{path}")

    system("cp -r aa_sample/. #{path}/")

    if git_remote.present?
      Dir.chdir("#{Rails.root.parent}/projects/#{path}")
      system("git init && git remote add origin #{git_remote} && git checkout -b master && git add .&& git commit -m 'Initial project' && git push origin master -f")
    end
  end

  def vercel_domain_present?
    vercel_domain.present? && vercel_domain_changed?
  end

  def git_remote_present?
    git_remote.present? && git_remote_changed?
  end
end
