require 'google/apis/analyticsreporting_v4'
require 'pp'

# 対象サイトのURL
BASE_URL = "http://qs.nndo.jp"

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

# 集計期間を直近本日に
date_range = analytics::DateRange.new(start_date: 'today', end_date: 'today')

# レポートの対象をセッション単位に
metric = analytics::Metric.new(expression: 'ga:users', alias: 'users')

# ページ別に集計する
dimension = analytics::Dimension.new(name: 'ga:pagePath')

# カウント数順にソート
order_by = analytics::OrderBy.new(field_name: 'ga:users', sort_order: 'DESCENDING')

# GoogleアナリティクスAPIより、レポートの取得
request = analytics::GetReportsRequest.new(
  report_requests: [analytics::ReportRequest.new(
    view_id: view_id,
    metrics: [metric],
    date_ranges: [date_range],
    dimensions: [dimension],
    order_bys: [order_by],
  )]
)
response = client.batch_get_reports(request)

# 結果の出力
data = response.reports.first.data
puts "累計ユーザ数: #{data.totals.first.values.first}"
data.rows.each do |row|
  puts "#{row.metrics.first.values.first}: #{BASE_URL + row.dimensions.first}"
end
