# ドットインストールのsed入門
> https://dotinstall.com/lessons/basic_sed/22201

## 2
- 読み方は「セド」らしい
- sed -e '3d' names.txt
  - 3行目を削除
- sed -i.bac '3d' names.txt
  - names.txtを結果で上書き。names.bacにバックアップを残す
- sed -f ex1.sed names.txt
  - sedのコードをファイルに記述してそれを利用できる

## 3
- sedの記述は、アドレスとコマンドで構成される
- '3d'なら3がアドレス、dがコマンド(delete)
- 1行ずつ読み込んで、アドレスに合致すればコマンドを実行

## 4
アドレスの指定方法
- ''  全行
- '3' 3行目
- '3!' 3行目以外
- '3;4' 3行目と4行目
- '3,5' 3行目から5行目
- '1~2' 1行目から2行ごと
- '$'   最後の行
- '//'  正規表現にマッチする行

## 5
コマンドの指定１
- '3p' 3行目を出力
- sed -n パターンスペースを表示しない
- '3q' 3行目で処理を終了する
- '3i\hoge' 3行目の前にhogeを挿入
- '3a\hoge' 3行目の後にhogeを挿入

## 6
文字の置換
- 'y/s/S/' sをSに置換
- 'y/so/SO/' sをSに、oをOに置換

## 7
文字列の置換
- 's/sa/SA/' saをSAに置換
- 's/sa/SA/g/' 全件対象にする
- 's/sa/SA/2/' 2番目だけを対象にする
- 's/sa/SA/i/' 大文字小文字を区別しない
- 's/[aiueo]/@/gi' 正規表現で置換

## 8
文字列の置換２
- 's/[aiueo]/!&!/g' &で後方参照
- 's/\([aiueo]\)\([0-9]\)/\2 \1/g' 複数の後方参照

## 9,10
列単位の操作
- ホールドスペース: パターンスペースの内容を退避させる場所