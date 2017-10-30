require 'google/apis/analyticsreporting_v4'

class Analytics

  #
  # レポート対象を指定してオブジェクトを生成
  # @param [String] base_url  レポート対象サイトのURL
  # @param [String] view_id   ビューID
  #
  def initialize(base_url, view_id)
    @base_url = base_url
    @view_id  = view_id
    @analytics = Google::Apis::AnalyticsreportingV4
    auth
  end

  #
  # 指定した日のページごとのユーザ数を集計する
  # @param  [String] date 日付を表す文字列(todayなども可)
  # @return [Hash]   累計ユーザ数及びページごとのユーザ数
  #
  def report_sessions_count_by_date(date)
    date_range = @analytics::DateRange.new(start_date: date, end_date: date)
    metric = @analytics::Metric.new(expression: 'ga:sessions', alias: 'sessions')
    dimension = @analytics::Dimension.new(name: 'ga:pagePath')
    order_by = @analytics::OrderBy.new(field_name: 'ga:sessions', sort_order: 'DESCENDING')
    request = @analytics::GetReportsRequest.new(
      report_requests: [@analytics::ReportRequest.new(
        view_id: @view_id,
        metrics: [metric],
        date_ranges: [date_range],
        dimensions: [dimension],
        order_bys: [order_by],
      )]
    )
    response = @client.batch_get_reports(request)
    data = response.reports.first.data
    return {
      total: data.totals.first.values.first,
      pages: data.rows.map do |row|
        {
          url: @base_url + row.dimensions.first,
          views: row.metrics.first.values.first
        }
      end
    }
  end

  private

    #
    # GoogleアナリティクスAPIに認証する
    # 同ディレクトリにauth.jsonを配置すること
    #
    def auth
      scope = ['https://www.googleapis.com/auth/analytics.readonly']
      @client = @analytics::AnalyticsReportingService.new
      @client.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
        json_key_io: File.open('auth.json'),
        scope: scope
      )
    end

end
