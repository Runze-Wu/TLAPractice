---- MODULE MC ----
EXTENDS Alternation, TLC

\* Constant expression definition @modelExpressionEval
const_expr_163288350513337000 == 
Len(<<box>>)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_163288350513337000>>)
----

=============================================================================
\* Modification History
\* Created Wed Sep 29 10:45:05 CST 2021 by wrz
