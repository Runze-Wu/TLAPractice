-------------------------------- MODULE GCD --------------------------------
EXTENDS Integers, TLC, FiniteSets
Divides(p, n) == \E q \in Int: n = q * p
DivisorsOf(n) == {p \in Int: Divides(p,n)}
SetMax(S) == CHOOSE i \in S: \A j \in S: i >= j
GCD(m, n) == SetMax(DivisorsOf(m) \cap DivisorsOf(n))
GCD1 == \A m \in Nat\{0}: GCD(m, m) = m
GCD2 == \A m, n \in Nat\{0}: GCD(m, n) = GCD(n, m)
GCD3 == \A m, n \in Nat\{0}: (n > m) => (GCD(m, n) = GCD(m, n-m))
=============================================================================
\* Modification History
\* Last modified Sun Sep 26 10:45:13 CST 2021 by wrz
\* Created Fri Sep 24 16:16:22 CST 2021 by wrz
