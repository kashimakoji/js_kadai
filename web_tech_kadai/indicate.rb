#データを受け取り、返却するCGIプログラムの起動。サーバがプログラムを起動する時のルールを決めたもの
#HTMLから送られてきた値をサーバで受け取り、その値を反映させた処理を返すプログラムを構築することができる
require 'cgi'
cgi = CGI.new
# データを受け取った後、HTMLの形式でレスポンス（反応）を返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 受け取ったデータcgi['input']で取り出し、ローカル変数に代入する
  # 目印の'input'から情報を取り出す
  get = cgi['input']
  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>受け取った文字列は下記になります</p>
      <p>文字列：#{get}</p>
    </body>
  </html>"
}