------------------------------ MODULE DieHard ------------------------------
EXTENDS Integers
VARIABLES big, small

Min(m, n) == IF m < n THEN m ELSE n

Init == /\ big = 0
        /\ small = 0
TypeOK == /\ big \in 0..5
          /\ small \in 0..3

EmptyBig == /\ big' = 0
            /\ small' = small
EmptySmall == /\ small' = 0
              /\ big' = big
FillBig == /\ big' = 5
           /\ small' = small
FillSmall == /\ small' = 3
             /\ big' = big
BigToSmall == LET poured == Min(big+small, 3) - small IN
        /\ big' = big - poured
        /\ small' = small + poured
SmallToBig == LET poured == Min(big+small, 5) - big IN
        /\ small' = small - poured
        /\ big' = big + poured
        
Next == \/ EmptyBig
        \/ EmptySmall
        \/ FillBig
        \/ FillSmall
        \/ BigToSmall
        \/ SmallToBig
=============================================================================
\* Modification History
\* Last modified Fri Sep 24 15:35:48 CST 2021 by wrz
\* Created Fri Sep 24 15:12:54 CST 2021 by wrz
