---- MODULE MC ----
EXTENDS GCD, TLC

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_16326218075217000 ==
0..5
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_16326218075218000 ==
0..5
----
\* Constant expression definition @modelExpressionEval
const_expr_16326218075219000 == 
<<GCD1, GCD2, GCD3>>
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_16326218075219000>>)
----

=============================================================================
\* Modification History
\* Created Sun Sep 26 10:03:27 CST 2021 by wrz
