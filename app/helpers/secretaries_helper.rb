#coding: utf-8

module SecretariesHelper
  def cleverness_value(value)
    case value
    when 0 then
      "賢くない"
    when 1 then
      "やや賢くない"
    when 2 then
      "並み"
    when 3 then
      "やや賢い"
    when 4 then
      "賢い"
    else
      "判別不能"
    end
  end

  def accuracy_value(value)
    case value
    when 0 then
       "正確でない"
    when 1 then
      "やや正確でない"
    when 2 then
      "並み"
    when 3 then
      "やや正確"
    when 4 then
      "正確"
    else
      "不明"
    end
  end

  def main_secretary(value)
    case value
    when 1 then
      "メイン秘書"
    when 0 then
      "サブ秘書"
    else
      ""
    end
  end
end
