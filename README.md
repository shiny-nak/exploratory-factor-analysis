# exploratory-factor-analysis
Exploratory factor analysis

I perform factor analysis with item deletion.<br>
<br>
As the number of deleted items increases, the deletion pattern is huge.<br>
<br>
Therefore, it is useful to perform factor analysis in a search for all deletion patterns and output deletion item candidates that meet the conditions.<br>
・ The cumulative contribution rate is over 60%<br>
・ The eigenvalue of all factors is 1 or more<br>
・ There is at least one factor with a factor loading of 0.4 or more for all variables<br>
・ P value is 0.05 or more<br>
I just have to get deleted items that meet these condition.<br>
<br>
So I made it.<br>
<br>
探索的因子分析<br>
<br>
因子分析をするときには、データ収集前の仮定に基づいて因子数などを決定します。<br>
しかし、うまくいかないことがしばしばあります。<br>
例えば、固有値が小さい、寄与率が小さいなどなど。直面するとツラいですよね。<br>
原因は、そもそもの仮定にあるかもしれません。データの集め方に問題があったのかもしれません。<br>
<br>
でもそれで「上手くいきませんでした、終わり」とはいかないわけです。<br>
そこで項目削除という荒業をして調整してみましょう。<br>
<br>
ようするに、集めたデータから変数を除きます。<br>
はっきり言ってもったいないですが、意外な因子が発見されるなど、災い転じて福となす場合もあります。<br>
<br>
これをやろうと思うと、一つずつ変数を削除して、結果を見て、を繰り返すわけです。かなりコストです。<br>
さらに、削除する項目数が2,3,4..と増えれば、その削除パターンは膨大です。<br>
<br>
そこで、削除パターン全てについて探索的に因子分析を行ない、条件に合う削除項目候補を出力すれば便利です。今回は<br>
・累積寄与率が50%以上<br>
・全ての因子の固有値が1以上<br>
・全ての変数について因子負荷量が絶対値0.4以上の因子が一つ以上ある<br>
・p値が0.05以上<br>
この条件を満たす削除項目を得るようにすれば良いわけです。<br>
<br>
というわけで作りました。<br>
削除する項目の組み合わせ分、forを回して条件に当てはまらなければforを一回飛ばす感じです。<br>
<br>
注意<br>
・削除項目数が増えれば計算時間は指数的に膨大になります。<br>
・【重要】必ずしもこれらの結果から得られた結果は「良い因子分析結果」とは言えません。<br>
なぜなら因子分析は解釈可能性が優先されるべきだからです。きちんと解釈するべきで、解釈できなければ採用するべきではありません。<br>
・p値は目安として捉えるべきです。他の指標が得られるなら、その指標に基づいてモデルを選ぶべきです。<br>
<br>
計算時間の対策<br>
・並列化計算<br>
手元には並列化できるように用意していますが、これはエキストラなコンテンツだと判断します。わざわざ並列しなければ結果が得られないほどの項目削除が必要となると、これは少しやりすぎ感があります故。<br>
