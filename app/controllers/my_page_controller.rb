#coding: utf-8

require'rubygems'
require 'twitter'

class MyPageController < AbstractPcController
  ssl_allowed :index,:my_tweets

  helper_method :index_action?

  def index
    @user = current_user
    @my_books=Book.where('user_id=?',@user.id).latest.paginate(:page => params[:page], :per_page => 5)
    @my_schedule=Schedule.where('user_id=?',@user.id).latest.paginate(:page => params[:page], :per_page => 5)
    @my_tasks ||=Task.where('user_id=?',@user.id).latest.paginate(:page=>params[:pgae],:per_page=>5)
    MyTweets.tweet_analyze_for_user @user
    @secretary_message=MyTweets.alert_tweet @user,'ツブヤキを解析してデータ登録を'
    respond_to do |format|
      format.html
    end
  end

  def my_tweets
    @user = current_user
    #@client=Twitter::Client.new
    Twitter::Client.configure do |config|
      config.oauth_consumer_token='cxhImnAeGuuJDKESgvmqQ'
      config.oauth_consumer_secret='lqIOiWjPxrJ1lpF7zOe6H0PwG1vlPX9G8RkGvUDAGI'
    end
    @client=Twitter::Client.new :oauth_access=> {
      :key=>@user.token,
      :secret=>@user.secret
    }
    @user_timelines = @client.timeline_for(:user, :id =>@user.name, :count=>10)
    MyTweets.tweet_analyze_for_user @user
    flash[:now]=MyTweets.alert_tweet @user,'ツブヤキを解析してデータ登録を'
  end
 
  def index_action?
    if action_name.eql?("index")
      true
    else
      false
    end
  end

end
