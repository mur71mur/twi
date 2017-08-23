class TwitPoiPoi
  attr_accessor :client

  MURASE_ID = "murmurase"

  def set_client(type, consumer_key, consumer_secret, access_token, access_token_secret)
    twitter_klass = delegate_class(type)
    @client = twitter_klass.new do |config|
      config.consumer_key        = consumer_key
      config.consumer_secret     = consumer_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end
  end

  def reply(tweet:, reply_message:)
    client.update("@#{tweet.user.screen_name} #{reply_message} #{Time.now.strftime("%Y-%m-%d %H:%M:%S")}", in_reply_to_status_id: tweet.user.id)
  end

  private

  def delegate_class(type)
    case type
    when :rest
      Twitter::REST::Client
    when :streaming
      Twitter::Streaming::Client
    end
  end
end
