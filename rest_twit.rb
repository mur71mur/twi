class RestTwit < TwitPoiPoi
  def initialize(consumer_key:, consumer_secret:, access_token:, access_token_secret:)
    set_client(:rest, consumer_key, consumer_secret, access_token, access_token_secret)
  end

  # 特定の複数名ユーザーにリプライ
  def reply_to_tweets_of_specify_users(users, count: 5, reply_message: "")
    client.user_timeline(users, { count: count } ).each do |timeline|
      tweet = client.status(timeline.id) # ツイートを取得
      reply(tweet: tweet, reply_message: reply_message)
    end
  end
end
