class ReportAnalyticWorker
    include Sidekiq::Worker
    def perform
        google_api_credentials = GoogleApiCredential.where.not(private_key: nil)
        google_api_credentials.each do |google_api_credential|
            GoogleConsole::AnalyticService.new(
                project_id: google_api_credential.project_id,
                private_key_id: google_api_credential.private_key_id,
                private_key: google_api_credential.private_key,
                client_email: google_api_credential.client_email,
                client_id: google_api_credential.client_id,
                property_id: google_api_credential.property_id,
                id: google_api_credential.id
            ).execute
        end
    end
end
