require 'google/apis/analyticsreporting_v4'
require 'pp'

# GoogleアナリティクスAPIを利用するためのライブラリ
analytics = Google::Apis::AnalyticsreportingV4

# GoogleアナリティクスAPIの認証先URL
scope = ['https://www.googleapis.com/auth/analytics.readonly']

# GoogleアナリティクスAPIの認証を受ける
client = analytics::AnalyticsReportingService.new
client.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
  json_key_io: File.open('auth.json'),
  scope: scope
)

# 対象のアナリティクスのビューID
view_id = '158527891'

# レポートの対象をセッション単位に
metric = analytics::Metric.new(expression: 'ga:users', alias: 'users')

# GoogleアナリティクスAPIより、レポートの取得
request = analytics::GetReportsRequest.new(
  report_requests: [analytics::ReportRequest.new(
    view_id: view_id,
    metrics: [metric],
  )]
)
response = client.batch_get_reports(request)

# 結果の出力
pp response.reports.first.data.totals.first.values.first
