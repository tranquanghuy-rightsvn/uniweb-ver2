require 'google/analytics/data/v1beta'

class GoogleConsole::AnalyticService
  def initialize args
    @property_id = args[:property_id]
    @google_api_credential = GoogleApiCredential.find args[:id]
    @credentials = {
      type: "service_account",
      project_id: args[:project_id],
      private_key_id: args[:private_key_id],
      private_key: args[:private_key].gsub("\\n", "\n"),
      client_email: args[:client_email],
      client_id: args[:client_id],
      auth_uri: "https://accounts.google.com/o/oauth2/auth",
      token_uri: "https://accounts.google.com/o/oauth2/token",
      auth_provider_x509_cert_url: "https://www.googleapis.com/oauth2/v1/certs",
      client_x509_cert_url: "https://www.googleapis.com/robot/v1/metadata/x509/#{CGI.escape(args[:client_email])}",
      universe_domain: "googleapis.com"
    }
  end

  def execute
    logic_service
  end

  private
  attr_reader :client, :credentials, :property_id, :google_api_credential

  def logic_service
    verify_account
    calculate_total_views_by_day
    get_top_posts
    get_top_countries
  end

  def verify_account
    @client = ::Google::Analytics::Data::V1beta::AnalyticsData::Client.new do |config|
        config.credentials = ::Google::Auth::ServiceAccountCredentials.make_creds(json_key_io: StringIO.new(credentials.to_json))
    end
  end

  def get_report dimension_name
    property = "properties/#{property_id}"
    dimensions = [
        Google::Analytics::Data::V1beta::Dimension.new(name: dimension_name),
    ]
    metrics = [
        Google::Analytics::Data::V1beta::Metric.new(name: 'screenPageViews'),
    ]
    yesterday = (Date.today - 30).strftime('%Y-%m-%d')
    to_day = (Date.today).strftime('%Y-%m-%d')
    date_ranges = [
        Google::Analytics::Data::V1beta::DateRange.new(start_date: yesterday, end_date: to_day),
    ]

    request = Google::Analytics::Data::V1beta::RunReportRequest.new(
        property: property ,
        dimensions: dimensions,
        metrics: metrics,
        date_ranges: date_ranges
    )

    response = @client.run_report(request)
    response
  end

  def calculate_total_views_by_day
    response = get_report("date")

    rows = response.rows
    recent_days_data = rows.first(7)
    daily_views = {}

    recent_days_data.each do |row|
      date = row.dimension_values.first.value
      views = row.metric_values.first.value.to_i
      daily_views[date] = views
    end

    daily_views = daily_views.sort.to_h
    google_api_credential.update! number_of_views: daily_views
  end
  
  def get_top_posts
    limit = 7
    response = get_report("pageTitle")
    posts = []
    response.rows.each do |row|
      page_title = row.dimension_values[0].value
      views = row.metric_values[0].value.to_i
      posts << { page_title: page_title, views: views }
    end
  
    sorted_posts = posts.sort_by { |post| -post[:views] }
    top_posts = sorted_posts.take(limit)
    google_api_credential.update! top_posts: top_posts.to_json
  end
  
  def get_top_countries
    limit = 7
    response = get_report("country")
    countries = []
  
    response.rows.each do |row|
      country_name = row.dimension_values[0].value
      views = row.metric_values[0].value.to_i
      countries << { country_name: country_name, views: views }
    end
  
    sorted_countries = countries.sort_by { |country| -country[:views] }
    top_countries = sorted_countries.take(limit)
    google_api_credential.update! top_countries: top_countries.to_json
  end
end
