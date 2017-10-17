eratohoK1.11.3_特殊勢力君主ランダム名前不具合修正


http://jbbs.shitaraba.net/bbs/read.cgi/otaku/16783/1503407321/113#113
で不具合が報告されてるけど
https://github.com/wamekukyouzin/eratohoK/commit/e834a39c104cab7fbae39b3e463050d67adc98b6
では修正できてないようなので、それを修正します。

また、
女あなたを主人公にして開始した後、特殊勢力君主の名前がランダムで生成された場合に君主が女性名になる
を修正します。
性別を決める処理を頭のほうに移動したのと、CALL SET_RANDOM_NAME_KおよびSET_RANDOM_NAME_Jの引数を変更しています。


よく見ると、元々 ERB\R_CHARA\NAME_LIST.ERB にある @SET_RANDOM_NAME_K や @SET_RANDOM_NAME_J の中身が微妙かもしれないけど、そこはノータッチです。


ERB\SYSTEM\SP_COUNTRY\SP_COUNTRY_FUNCTIONS.ERB
1ファイルだけを上書きする形になります。


本体に取り込まれた場合は、パッチ作者による新規作成箇所および変更箇所の権利を放棄します。
