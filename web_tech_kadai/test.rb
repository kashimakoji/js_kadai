require 'webrick' #Webサーバ作成
server = WEBrick::HTTPServer.new({
    :DocumentRoot => '.',                                       #このアプリのドメインの設定
    :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,  #このプログラムを実行できるプログラム本体の居場所を指定
    :Port => '3000',            #ポートの設定　これら３つを設定する必要がある
})
['INT', 'TERM'].each {|signal|
    Signal.trap(signal){ server.shutdown}
}
#Webサーバを起動した状態で、/testというURLを送信すると、同じディレクトリ階層にあるtest.html.erbファイルを表示する、という機能が付加される
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
#<form>~</form>の中にある値を、indicade.rbに送信することができる
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler,'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler,'goya.rb')
server.mount('/goya2.cgi', WEBrick::HTTPServlet::CGIHandler,'goya2.rb')
server.mount('/goya3.cgi', WEBrick::HTTPServlet::CGIHandler,'goya3.rb')
server.start