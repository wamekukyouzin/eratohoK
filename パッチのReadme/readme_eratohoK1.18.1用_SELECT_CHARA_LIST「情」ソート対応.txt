eratohoK1.18.1用_SELECT_CHARA_LIST「情」ソート対応

・SELECT_CHARA_LISTやSELECT_CHARA_LIST_MULTIで「情」を押してから[前のキャラ] [次のキャラ]を押した結果がソートに対応してない
・SELECT_CHARA_LISTやSELECT_CHARA_LIST_MULTIで「情」を押してから[戻る]を押すとソートされてない（その状態で適当なボタンを押すと正常にソートされる）
を修正します。

ファイルは
ERB\SYSTEM\SELECT_CHARA_LIST.ERB
だけです。

これで問題なく動作してるよね？大丈夫だよね？



改変部分の再改変・流用について
 - eraで利用するなら自由
 - era以外で利用するなら不可
とします。（eratohoK本体のreadme.mdに書いてある「明記していない場合」と同じです。）
なお、改変部分はERB\SYSTEM\SELECT_CHARA_LIST.ERBの極一部分なので、それ以外の部分は私があーだこーだ言う対象ではありません。
