# coding: utf-8
require 'twitter'
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

#loop do
	#タイムラインの新しいツイートの情報をtweetに入れる
	client.home_timeline.take(1).each do |tweet|
	#アカ名とツイート内容を表示
    	puts "#{tweet.user.screen_name}:"
    	puts "#{tweet.text}"
		#ツイートのidを変数idにいれる
		id = tweet.id.to_s
	#そのidにファボしてリプ送る
    	client.favorite(id)
		puts id
		client.update("ハチフランシスコなう", in_reply_to_status_id: id, place_id: "df51dec6f4ee2b2c")
	end
#end
