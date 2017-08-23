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
  consumer_key: "B9CBZt35aWu2jQZMS4SIVZmvR",
  consumer_secret: "KEQ7jkPhySGE3RO9qebsCsAVRdD41nk1XAXDfMsqlMkn9sGAfO",
  access_token: "511374570-U6FlMOHEubB5yI9bOuSVJCJH6NVcZhOdpQHuUPZq",
  access_token_secret: "KgbR68aj8ArFd3Tl06kXVYZqNPwTi1CniEdl3GnheOHrM"
}

streaming_twit = StreamingTwit.new(keys)
rest_twit = RestTwit.new(keys)

# これ書けばそこで処理がストップしてデバッグしやすくなるよ
# binding.pry

# こんな感じで使える
# streaming_twit.reply_to_tweets_with_more_than_certain_number_of_retweet_count(10000, reply_message: "test")
# rest_twit.reply_to_tweets_of_specify_users(["murmurase"], count: 100, reply_message: "プログラムからのリプライだよ")
