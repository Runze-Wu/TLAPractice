-------------------------------- MODULE GCD --------------------------------
EXTENDS Integers, TLC
Divides(p, n) == \E q \in Int: n = q * p
DivisorsOf(n) == {p \in Int: Divides(p,n)}
SetMax(S) == CHOOSE i \in S: \A j \in S: i >= j
GCD(m, n) == SetMax(DivisorsOf(m) \cap DivisorsOf(n))
=============================================================================
\* Modification History
\* Last modified Fri Sep 24 16:53:14 CST 2021 by wrz
\* Created Fri Sep 24 16:16:22 CST 2021 by wrz
