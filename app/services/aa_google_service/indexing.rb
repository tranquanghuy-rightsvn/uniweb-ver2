require 'google/apis/indexing_v3'
require 'googleauth'

module AaGoogleService
  class Indexing
    def initialize
      # @property_id = args[:property_id]
      # @google_api_credential = GoogleApiCredential.find args[:id]
      # @credentials = {
      #   type: "service_account",
      #   project_id: args[:project_id],
      #   private_key_id: args[:private_key_id],
      #   private_key: args[:private_key].gsub("\\n", "\n"),
      #   client_email: args[:client_email],
      #   client_id: args[:client_id],
      #   auth_uri: "https://accounts.google.com/o/oauth2/auth",
      #   token_uri: "https://accounts.google.com/o/oauth2/token",
      #   auth_provider_x509_cert_url: "https://www.googleapis.com/oauth2/v1/certs",
      #   client_x509_cert_url: "https://www.googleapis.com/robot/v1/metadata/x509/#{CGI.escape(args[:client_email])}",
      #   universe_domain: "googleapis.com"
      # }
    end
  # websitegiare-daa3c70f8d92.json
    def perform
      service = Google::Apis::IndexingV3::IndexingService.new

      scope = 'https://www.googleapis.com/auth/content'

      service.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
        json_key_io: File.open(Rails.root.join('public', 'websitegiare-index.json')),
        scope: scope)


      service.authorization.fetch_access_token!
      a = service.get_url_notification_metadata(url: 'https://www.websitegiare.co/tin-don-momo-bi-sep-lon-xoa-du-lieu-nguoi-dung-khong-can-tra-no-.html')
      byebug
    end
  end
end
