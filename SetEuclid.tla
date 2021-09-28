----------------------------- MODULE SetEuclid -----------------------------
EXTENDS Integers, TLC, FiniteSets, GCD
(***************************************************************************)
(* Euclid's Algorithm for Sets                                             *)
(* SetGCD(T): Define the gcd of a set T of positive integers               *)
(* SetSum(T): Define the sum of all the elements in a finite set of number *)
(***************************************************************************)

SetGCD(T) == SetMax({d \in Int: \A t \in T: Divides(d, t)})
RECURSIVE SetSum(_)
SetSum(T) == IF T = {} THEN 0
                       ELSE LET t == CHOOSE x \in T: TRUE
                            IN  t + SetSum(T\{t})
(***************************************************************************
--fair algorithm SetEuclid {
    variables S = Nat\{0};
    { while(Cardinality(S)>1)
    { with( x \in S, y \in {s \in S: s>x} )
        { S:= (S\{y}) \cap {y-x}}
    }
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "c321d4cd" /\ chksum(tla) = "73d92143")
VARIABLES S, pc

vars == << S, pc >>

Init == (* Global variables *)
        /\ S = (Nat\{0})
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF Cardinality(S)>1
               THEN /\ \E x \in S:
                         \E y \in {s \in S: s>x}:
                           S' = ((S\{y}) \cap {y-x})
                    /\ pc' = "Lbl_1"
               ELSE /\ pc' = "Done"
                    /\ S' = S

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1
           \/ Terminating

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION 
=============================================================================
\* Modification History
\* Last modified Sun Sep 26 10:44:30 CST 2021 by wrz
\* Created Sun Sep 26 10:43:23 CST 2021 by wrz
