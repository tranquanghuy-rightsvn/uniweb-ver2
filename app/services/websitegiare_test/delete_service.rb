class WebsitegiareTest::DeleteService
  attr_accessor :resource

  def initialize resource
    @resource = resource
  end

  def perform
    file_path = "projects/websitegiare_test/" + resource.url

    if File.exist?(file_path)
      File.delete(file_path)
    end

    system('cd projects/websitegiare_test && git add . && git commit --amend --no-edit && git push origin master -f')
  end
end
