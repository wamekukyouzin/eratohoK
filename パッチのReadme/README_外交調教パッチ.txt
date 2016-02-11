◇eratohoK Ver0.166用 外交調教・性的外交強化パッチ

■概要
　1.停戦・同盟締結時の調教要求の追加
　　分岐だけ存在していて機能していなかった調教要求を動かしてみました。
　　君主が調教される場合「あてがう」と同様の挙動をします。
　2.停戦・同盟締結時の性的要求の追加
　　分岐だけ存在していて機能していなかった、性的要求時の「一晩慰み物」「兵士あてがい」を動かしてみました。
　3.その他
　　性的要求対象の選択時、君主及びあなたと相手君主の性別を判定基準に組み込みました。

　地文は会談時のものをお借りしました。

■パッチ内容
・Flag.CSV
　74,調教要求フラグを追加

・DIPLOMACY_REQUESTED.ERB
　@DIPLOMACY_REQUESTED
　　要求選択分岐の変更
　　DEPLOMACY_REQUESTED_SEX → DIPLOMACY_REQUESTED_SEX
　　DEPLOMACY_REQUESTED_TRAIN → DIPLOMACY_REQUESTED_TRAIN
　@DIPLOMACY_REQUESTED_SEX
　　関数名の変更(元：@DEPLOMACY_REQUESTED_SEX)
　　性別による要求対象の判定
　　「一晩慰み物」「兵士あてがい」の追加
　@DIPLOMACY_REQUESTED_TRAIN
　　関数名の変更(元：@DEPLOMACY_REQUESTED_TRAIN)
　　実装

・SLG_VARIABLE.ERH
　本パッチで利用する変数の導入
　DIPLOMACY_TRAINED_DAY　逆調教要求の残り期間 正数にてMASTER調教、負数にて君主調教を表す
　DIPLOMACY_TRAINING_CHARA　逆調教する相手君主のキャラ番号

・SLG_FUNCTION.ERB
　@DESTROY_COUNTRY
　　調教した/された勢力が滅亡した際、各変数をリセットする挙動の追加

・TURNEND.ERB
　@EVENTTURNEND
　　調教処理の追加

■導入方法
　eratohoK Ver0.166用 不具合修正パッチ（の再修正版）(eraT0008644)を適用した上から導入してください。

■更新履歴
2016/02/06 初版