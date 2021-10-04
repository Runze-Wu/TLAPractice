---- MODULE MC ----
EXTENDS Alternation, TLC

\* Constant expression definition @modelExpressionEval
const_expr_163288355326639000 == 
Len(box)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_163288355326639000>>)
----

=============================================================================
\* Modification History
\* Created Wed Sep 29 10:45:53 CST 2021 by wrz
