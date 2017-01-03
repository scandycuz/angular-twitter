
class TwitterOAuth
  def initialize(api_key, api_secret, token, token_secret)
    @consumer_key = OAuth::Consumer.new(
        api_key,
        api_secret)
    @access_token = OAuth::Token.new(
        token,
        token_secret)

    baseurl = "https://api.twitter.com"

    address = URI("#{baseurl}/1.1/account/verify_credentials.json")

    http = Net::HTTP.new address.host, address.port
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Get.new address.request_uri
    request.oauth! http, @consumer_key, @access_token

    http.start
    response = http.request request
    puts "The response status was #{response.code}"
  end

  def get_tweet(id)
    baseurl = "https://api.twitter.com"
    path    = "/1.1/statuses/show.json"
    query   = URI.encode_www_form("id" => id)
    address = URI("#{baseurl}#{path}?#{query}")
    request = Net::HTTP::Get.new address.request_uri

    # Set up HTTP.
    http             = Net::HTTP.new address.host, address.port
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    # Issue the request.
    request.oauth! http, @consumer_key, @access_token
    http.start
    response = http.request request

    # Parse and print the Tweet if the response code was 200
    tweet = nil
    if response.code == '200' then
      tweet = JSON.parse(response.body)
      return tweet
    end
  end

  def search_tweets(params)
    baseurl = "https://api.twitter.com"
    path    = "/1.1/search/tweets.json"
    query   = URI.encode_www_form(params)
    address = URI("#{baseurl}#{path}?#{query}")
    request = Net::HTTP::Get.new address.request_uri

    http             = Net::HTTP.new address.host, address.port
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request.oauth! http, @consumer_key, @access_token
    http.start
    response = http.request request

    if response.code == '200' then
      tweets = JSON.parse(response.body)
      return tweets
    end

    nil
  end
end
