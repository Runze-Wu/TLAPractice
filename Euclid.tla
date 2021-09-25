------------------------------- MODULE Euclid -------------------------------
EXTENDS Integers, GCD
CONSTANTS M, N
(***************************************************************************
--fair algorithm Euclid {
\*    variables x \in 1..N, y \in 1..N, x0 = x, y0 = y;
    variables x = M, y = N;
    { while (x # y) { if (x < y) {y := y - x}
                      else {x := x - y}
                    };
\*      print <<x, y>>;
\*      assert (x = y) /\ (x = GCD(x0, y0));
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "aba70d42" /\ chksum(tla) = "6b100a2a")
VARIABLES x, y, pc

vars == << x, y, pc >>

Init == (* Global variables *)
        /\ x = M
        /\ y = N
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF x # y
               THEN /\ IF x < y
                          THEN /\ y' = y - x
                               /\ x' = x
                          ELSE /\ x' = x - y
                               /\ y' = y
                    /\ pc' = "Lbl_1"
               ELSE /\ pc' = "Done"
                    /\ UNCHANGED << x, y >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1
           \/ Terminating

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION 
Safety == (pc = "Done") => (x = y) /\ (x = GCD(M, N))
(***************************************************************************)
(* Safety and Liveness (Termination in this part) means Correctness        *)
(***************************************************************************) 
=============================================================================
\* Modification History
\* Last modified Fri Sep 24 20:35:55 CST 2021 by wrz
\* Created Fri Sep 24 16:52:34 CST 2021 by wrz
