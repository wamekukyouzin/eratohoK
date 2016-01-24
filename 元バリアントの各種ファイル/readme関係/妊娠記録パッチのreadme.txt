20150518_era恋姫_妊娠記録のreadme

・適用方法
そのまま上書きして適用できます。
能力表示に"2[妊娠記録]"ボタンが追加されます。
同梱のセーブデータは確認用です。桃香さんでご確認下さい。
他のキャラの記録が一部変ですが作業中のデータが混じっているせいです。

・編集元
era恋姫 20150506

・編集点
CSV/VariableSize.csv : CSTR,100を130にした
ERB/TRAIN/PREGNANT.ERB : 228行目に記録のための関数呼び出しを追加した
ERB/TRAIN/PREGNANT_RECORD.ERB : 新規作成。記録処理のメイン部分
ERB/TRAIN/PREGNANT_RECORD.ERH : 新規作成。↑で使う変数を記述
ERB/SHOP/SHOP_LIFE.ERB : @SELECTED_SHOWDATAの冒頭に表示切り替えボタンを追加
ERB/SYSTEM/SHOW_INFO.ERB : @SHOW_INFO(ARG:0)の冒頭に表示の呼び出しを追加

・やってること
あるキャラが誰の子を何回妊娠したかの記録を取ります。
記録するタイミングは妊娠発覚時です。
父親の名前をCSTRに記録し、CFLAGに回数を記録しています。

CSTRとCFLAGの使用範囲はERHで指定しています。
暫定でCSTR:100-129、CFLAG:250-279を使うようにしています。

・ファイルの改変等はご自由にどうぞ。

