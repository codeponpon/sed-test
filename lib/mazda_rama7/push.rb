module MazdaRama7
  class Push
    attr_reader :http, :request

    def initialize(msg, uuid, data)
      # TODO:: Change language content to :en if it available
      params = {"app_id" => ENV['ONESIGNAL_APP_ID'],
                "contents" => {"en" => msg[:th], "th" => msg[:th]},
                "include_player_ids" => uuid.split(','),
                "data": data}
      uri = URI.parse("#{ENV['ONESIGNAL_API_URL']}/notifications")
      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = true
      @request = Net::HTTP::Post.new(uri.path,
                                    'Content-Type'  => 'application/json;charset=utf-8',
                                    'Authorization' => ENV['ONESIGNAL_REST_API_KEY'])
      @request.body = params.as_json.to_json
    end

    def send_notification
      response = @http.request(@request)
      JSON.parse(response.body)
    end
  end
end