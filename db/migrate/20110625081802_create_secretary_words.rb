#coding: utf-8

class CreateSecretaryWords < ActiveRecord::Migration
  def self.up
    create_table :secretary_words do |t|
      t.string :word
      t.timestamps
    end
    @secretary_word =SecretaryWord.new
    @secretary_word.word= "しました！特に問題もありませんでした。"
    @secretary_word.save

    @secretary_word2 =SecretaryWord.new
    @secretary_word2.word = "させて頂きましたー。お疲れ様です。"
    @secretary_word2.save

    @secretary_word3 =SecretaryWord.new
    @secretary_word3.word = "しちゃいました～。疲れましたー。"
    @secretary_word3.save

    @secretary_word4 =SecretaryWord.new
    @secretary_word4.word = "してみました・・・。ダメでしたでしょうか？"
    @secretary_word4.save

    @secretary_word5 =SecretaryWord.new
    @secretary_word5.word = "してやったよ！！文句あるか？？"
    @secretary_word5.save

    add_index :secretaries, [:user_id,:main_flag]
  end

  def self.down
    drop_table :secretary_words
    remove_index :secretaries, [:user_id,:main_flag]
  end
end
