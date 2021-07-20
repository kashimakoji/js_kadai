require 'pg'
connection = PG::connect(dbname: "goya") #PG::connect(dbname:goya)により、rubyからgoyaDBに接続し
connection.internal_encoding = "UTF-8"   #接続したという情報をconnectionという変数に入れる
begin
    result = connection.exec("select wight, give_for from crops;")
    #connection変数を使いPostgreSQLを操作する。.execで、goyaDBに"select weight, give_for from crops;"の
    #SQLの命令文を直接実行し、その結果をresultに入れる。
    result.each do |record|     #取り出した各行を処理する。各行をとり出しターミナル上に出力する
        puts "ゴーヤの大きさ：#{record["wight"]} 売った相手：#{record["give_for"]}"
    end


    result = connection.exec("select give_for from crops    
                                WHERE give_for != '自家消費';")
    result.each do |record|     #取り出した各行を処理する。各行をとり出しターミナル上に出力する
        puts "譲渡先が自家消費以外：#{record["give_for"]}"
    end

    result = connection.exec("select quality from crops    
                                WHERE quality = false;")
    result.each do |record|     #取り出した各行を処理する。各行をとり出しターミナル上に出力する
        puts "品質が悪い：#{record["quality"]}"
    end

ensure
    connection.finish   #最後に.finishでデータベースのコネクションを切断する
end
