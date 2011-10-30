#coding: utf-8

require'rubygems'
require 'twitter'

class MyTweets < ActiveRecord::Base
  def self.tweets_analyze
    @users = User.all
    for user in @users
      tweet_analyze_for_user @users
    end
  end

  def self.tweet_analyze_for_user user
    Twitter::Client.configure do |config|
      config.oauth_consumer_token='cxhImnAeGuuJDKESgvmqQ'
      config.oauth_consumer_secret='lqIOiWjPxrJ1lpF7zOe6H0PwG1vlPX9G8RkGvUDAGI'
    end
    @client=Twitter::Client.new :oauth_access=> {
      :key=>user.token,
      :secret=>user.secret
    }
    @user_timelines = @client.timeline_for(:user, :id =>user.name, :count => 40)
    #正規表現でデータを登録する。
    text_analyze @user_timelines,user
  end

  def self.text_analyze timelines, user
    for user_tweet in timelines
      record_book_from_tweet user_tweet,user
      record_schedule_from_tweet user_tweet, user
      record_task_from_tweet user_tweet,user
    end
  end

  def self.alert_tweet(user,message)
    Twitter::Client.configure do |config|
      config.oauth_consumer_token='cxhImnAeGuuJDKESgvmqQ'
      config.oauth_consumer_secret='lqIOiWjPxrJ1lpF7zOe6H0PwG1vlPX9G8RkGvUDAGI'
    end
    @client=Twitter::Client.new :oauth_access=> {
      :key=>user.token,
      :secret=>user.secret
    }
    #ユーザの持っている秘書情報から報告の文言を変える。
    @user_sercretaries=Secretary.where('user_id=?',user.id).is_main
    @secretary_message=""
    unless @user_sercretaries.empty?
      @secretary_word = SecretaryWord.find( @user_sercretaries[0].secretary_word_id)
      @secretary_message = message+@secretary_word.word
      #@client.status(:post,message+@secretary_word.word)
    end
  end

  private
  def self.record_book_from_tweet(user_tweet,user)
    tweet_texts=user_tweet.text.scan(/.*という名前の本が欲しい/)
    if tweet_texts.size > 0
      book = Book.new
      title = tweet_texts[0].tr("という名前の本が欲しい","")
      books=Book.where("title = ? and user_id = ?",title,user.id)
      if books.size > 0
        return
      end
      book.title= title
      book.user_id=user.id
      book.description=user_tweet.text
      book.save
    end
  end
  def self.record_schedule_from_tweet(user_tweet,user)
    tweet_texts=user_tweet.text.scan(/.*に予定を入れようかな/)
    if tweet_texts.size > 0
      @schedule = Schedule.new
      date = tweet_texts[0].tr("に予定を入れようかな","")
      @schedules =Schedule.where("title = ? and user_id = ?",date,user.id)
      if @schedules.size > 0
        return
      end
      @schedule.title= date
      @schedule.user_id=user.id
      @schedule.detail=user_tweet.text
      @schedule.date=date
      @schedule.save
    end
  end

  def self.record_task_from_tweet(user_tweet,user)
    tweet_texts=user_tweet.text.scan(/.*TODO.*/)
    if tweet_texts.size > 0
      @task = Task.new
      title = tweet_texts[0].tr("TODO","")
      @tasks =Task.where("title = ? and user_id = ?",title,user.id)
      if @tasks.size > 0
        return
      end
      @task.title= title
      @task.user_id=user.id
      @task.priority=1
      @task.save
    end
  end
end
