---- MODULE MC ----
EXTENDS Handshake, TLC

\* Constant expression definition @modelExpressionEval
const_expr_163333179011425000 == 
p \oplus c
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_163333179011425000>>)
----

\* PROPERTY definition @modelCorrectnessProperties:0
prop_163333179011426000 ==
A!Spec
----
=============================================================================
\* Modification History
\* Created Mon Oct 04 15:16:30 CST 2021 by wrz
