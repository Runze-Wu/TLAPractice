---- MODULE MC ----
EXTENDS Alternation, TLC

\* Constant expression definition @modelExpressionEval
const_expr_163288342255633000 == 
Len(box)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_163288342255633000>>)
----

=============================================================================
\* Modification History
\* Created Wed Sep 29 10:43:42 CST 2021 by wrz
