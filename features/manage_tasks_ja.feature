# language: ja
フィーチャ: タスクを管理する
  [ゴール]に到達するために
  [ステークホルダ]は
  [振る舞い]が欲しい

  シナリオ: 新しいタスクを登録する
    "前提" "the new task page"ページを表示している
    "もし" "Title"に "title 1"と入力すると
    "かつ" "Create"ボタンをクリックする
    "ならば" "title 1"と表示されること

  シナリオ: タスクを編集する
    "前提" "the edit task page"ページを表示している
    "もし" "Title"に "title title title"と入力すると
    "かつ" "id"に"1"と入力すると
    "かつ" "Update"ボタンをクリックする
    "ならば" "title title title"と表示されること

  シナリオ: タスクを削除する
    "前提" 次のタスクがあるとき:
      |title|
      |title 1|
      |title 2|
      |title 3|
      |title 4|
    "もし" 3番目のタスクを削除する
    "ならば" "次のタスクが表示されること":
      |Title|
      |title 1|
      |title 2|
      |title 4|
