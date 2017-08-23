class StreamingTwit < TwitPoiPoi
  def initialize(consumer_key:, consumer_secret:, access_token:, access_token_secret:)
    set_client(:streaming, consumer_key, consumer_secret, access_token, access_token_secret)
  end

  def reply_to_tweets_with_more_than_certain_number_of_retweet_count(retweet_count, reply_message: "")
    client.sample do |object|
      if object.is_a?(Twitter::Tweet) && object.retweet_count >= retweet_count
        reply(tweet: object, reply_message: reply_message)
      end
    end
  end
end
