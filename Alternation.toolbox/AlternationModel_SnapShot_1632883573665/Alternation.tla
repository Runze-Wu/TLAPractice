---------------------------- MODULE Alternation ----------------------------
EXTENDS Sequences, Integers
Put(s) == Append(s, "widget")
Get(s) == Tail(s)

VARIABLES box

vars == << box >>

Init == /\ box = <<>>

Next == /\ IF Len(box) = 1
           THEN box' = Get(box)
           ELSE box' = Put(box)
           
Spec == Init /\ [][Next]_vars

Invariant == Len(box) <= 1
=============================================================================
\* Modification History
\* Last modified Wed Sep 29 10:45:40 CST 2021 by wrz
\* Created Wed Sep 29 10:18:30 CST 2021 by wrz
