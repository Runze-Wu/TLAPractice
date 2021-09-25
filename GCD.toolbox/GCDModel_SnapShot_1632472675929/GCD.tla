-------------------------------- MODULE GCD --------------------------------
EXTENDS Integers, TLC
Divides(p, n) == \E q \in Int: n = q * p
DivisorsOf(n) == {p \in Int: Divides(p,n)}
SetMax(S) == CHOOSE i \in S: \A j \in S: i >= j
GCD(m, n) == SetMax(DivisorsOf(m) \cap DivisorsOf(n))
VARIABLES m, n
Init == /\ m = 24
        /\ n \in Int
GetRes == PrintT(<<m, n, GCD(m,n)>>)

Next == GetRes
=============================================================================
\* Modification History
\* Last modified Fri Sep 24 16:37:30 CST 2021 by wrz
\* Created Fri Sep 24 16:16:22 CST 2021 by wrz
