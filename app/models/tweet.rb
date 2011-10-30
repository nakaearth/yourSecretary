require'rubygems'
require 'twitter'

class Tweet < ActiveRecord::Base
  def self.popular_friend user
   Twitter::Client.configure do |config|
      config.oauth_consumer_token='cxhImnAeGuuJDKESgvmqQ'
      config.oauth_consumer_secret='lqIOiWjPxrJ1lpF7zOe6H0PwG1vlPX9G8RkGvUDAGI'
    end
    @client=Twitter::Client.new :oauth_access=> {
      :key=>user.token,
      :secret=>user.secret
    }
    @tweets =  @client.graph(:friends, user.uid)
    #@tweets=client.friends.sort{|a, b| a.followers_count <=> b.followers_count}.reverse.first.name
  end

end
