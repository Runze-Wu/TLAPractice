------------------------------- MODULE Euclid -------------------------------
EXTENDS Integers, GCD
CONSTANTS M, N
(***************************************************************************
--fair algorithm Euclid {
\*    variables x \in 1..N, y \in 1..N, x0 = x, y0 = y;
    variables x = M, y = N;
    { judge: while (x # y) { do: if (x < y) {y := y - x}
                      else {x := x - y}
                    };
\*      print <<x, y>>;
\*      assert (x = y) /\ (x = GCD(x0, y0));
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "65d8d3f8" /\ chksum(tla) = "9d2756b")
VARIABLES x, y, pc

vars == << x, y, pc >>

Init == (* Global variables *)
        /\ x = M
        /\ y = N
        /\ pc = "judge"

judge == /\ pc = "judge"
         /\ IF x # y
               THEN /\ pc' = "do"
               ELSE /\ pc' = "Done"
         /\ UNCHANGED << x, y >>

do == /\ pc = "do"
      /\ IF x < y
            THEN /\ y' = y - x
                 /\ x' = x
            ELSE /\ x' = x - y
                 /\ y' = y
      /\ pc' = "judge"

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == judge \/ do
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
\* Last modified Wed Sep 29 15:21:51 CST 2021 by wrz
\* Created Fri Sep 24 16:52:34 CST 2021 by wrz
