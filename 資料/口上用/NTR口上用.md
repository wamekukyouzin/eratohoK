「あてがう」ＮＴＲ関連の関数リスト
=================

## @KOJO_NTR_GAIN(ARG:0, ARG:1) 
##@ KOJO_NTR_GAIN_K{ARG:0}(ARG:1)
NTRを取得したとき・ＮＴＲ済みであてがったとき用の関数。ARG:0はキャラ番号、ARG:1は対象の番号。  
恋慕等の陥落素質が失われる前に呼ばれるので、どちらの陥落ルートだったかの分岐を内部で仕込むことができる。  
取得が二回目だとかそういうのはシステム側には特に設けていないので、口上用のCFLAG領域にでも記憶するといい。

## @KOJO_NTR_ATEGAU(ARG:0, ARG:1)
## @KOJO_NTR_ATEGAU_K{ARG:0}(ARG:1)
「あてがう」でヤられる側に指定されたキャラの、調教開始前に表示される口上。ARG:0はキャラ番号、ARG:1は対象の番号。

## @KOJO_NTR_PROGRESS(ARG:0, ARG:1)
## @KOJO_NTR_PROGRESS_K{ARG:0}(ARG:1)
NTRが進行中であるときの関数。ARG:0はキャラ番号、ARG:1は対象の番号。  
進行度合いや陥落ルートによる分岐は口上側で仕込むこと。

## @KOJO_NTR_TRAIN(ARG:0, ARG:1, ARG:2)
## @KOJO_NTR_TRAIN{ARG:0}(ARG:1, ARG:2)
NTR後のプレイ時の関数。ARG:0はキャラ番号、ARG:1は対象の番号、ARG:2はプレイの地の文の分岐を示す乱数。  
なおNTR後のプレイはver 1.60テスト版時点で未実装。


