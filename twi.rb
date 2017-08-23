# coding: utf-8
# 準備:
# 1. gem install bundler
# 2. bundle install
# 3. ruby twi.rb
require 'bundler/setup'
require 'twitter'
require 'pry'

require './twit_poi_poi'
require './rest_twit'
require './streaming_twit'

keys = {
  consumer_key: "",
  consumer_secret: "",
  access_token: "",
  access_token_secret: ""
}

empty_keys = keys.select{|_, v| v.empty?}
raise "#{empty_keys.keys.join(', ')} が設定されていません。" unless empty_keys.empty?

streaming_twit = StreamingTwit.new(keys)
rest_twit = RestTwit.new(keys)

# これ書けばそこで処理がストップしてデバッグしやすくなるよ
# binding.pry

# こんな感じで使える
# streaming_twit.reply_to_tweets_with_more_than_certain_number_of_retweet_count(10000, reply_message: "test")
rest_twit.reply_to_tweets_of_specify_users(["murmurase"], count: 3, reply_message: "プログラムからのリプライだよ")
