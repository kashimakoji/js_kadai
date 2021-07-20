require 'cgi'
cgi = CGI.new
#🔽データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8"){
    #⬇︎情報の目印としたgoya2のデータをcgi['goya2']という記述で取り出し、ローカル変数に入れる
    get = cgi['goya2']
    #👇HTMLでレスポンスを返す
    "<html>
        <body>
            <p>自家消費以外の情報は下記になります</p>
            文字列＝#{get}
        </body>
    </html>"
}