#coding: UTF-8
require 'spec_helper'

describe MyTweets do
  context  "MyTweet Rspec Test" do
    before do
    end
    it "Tweet Analyze Test" do
      @tweet = "テスト本が欲しい#add_book。これはテストだ"
      @x=@tweet.scan(/.*add_book/)
      @x.size.should > 0

      @tweet2 = "テスト本が欲しい。これはテストだ"
      @x=@tweet2.scan(/.*本が欲しい/)
      @x.size.should > 0
      @x[0].should=='テスト本が欲しい'
    end
    it "Tweet Analyze Test2" do
    MyTweets.tweets_analyze
    end
  end
end
