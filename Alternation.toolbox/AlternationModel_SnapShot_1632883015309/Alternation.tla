---------------------------- MODULE Alternation ----------------------------
EXTENDS Sequences
Put(s) == Append(s, "widget")
Get(s) == Tail(s)

VARIABLES box

vars == << box >>

Init == /\ box = <<>>

Next == /\ IF Len(box) = 1
           THEN box' = Get(box)
           ELSE box' = Put(box)
           
Spec == Init /\ [][Next]_vars
=============================================================================
\* Modification History
\* Last modified Wed Sep 29 10:35:56 CST 2021 by wrz
\* Created Wed Sep 29 10:18:30 CST 2021 by wrz
