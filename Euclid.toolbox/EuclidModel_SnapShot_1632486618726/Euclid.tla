------------------------------- MODULE Euclid -------------------------------
EXTENDS Integers, GCD
CONSTANTS M, N
(***************************************************************************
--fair algorithm Euclid {
    variables x \in 1..N, y \in 1..N, x0 = x, y0 = y;
    { loop: while (x # y) { update: if (x < y) {y := y - x}
                      else {x := x - y}
                    };
      print <<x, y>>;
      assert (x = y) /\ (x = GCD(x0, y0));
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "c1b7766c" /\ chksum(tla) = "9dec3943")
VARIABLES x, y, x0, y0, pc

vars == << x, y, x0, y0, pc >>

Init == (* Global variables *)
        /\ x \in 1..N
        /\ y \in 1..N
        /\ x0 = x
        /\ y0 = y
        /\ pc = "loop"

loop == /\ pc = "loop"
        /\ IF x # y
              THEN /\ pc' = "update"
              ELSE /\ PrintT(<<x, y>>)
                   /\ Assert((x = y) /\ (x = GCD(x0, y0)), 
                             "Failure of assertion at line 11, column 7.")
                   /\ pc' = "Done"
        /\ UNCHANGED << x, y, x0, y0 >>

update == /\ pc = "update"
          /\ IF x < y
                THEN /\ y' = y - x
                     /\ x' = x
                ELSE /\ x' = x - y
                     /\ y' = y
          /\ pc' = "loop"
          /\ UNCHANGED << x0, y0 >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == loop \/ update
           \/ Terminating

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION 
Safety == (pc = "Done") => (x = y) /\ (x = GCD(x0,y0))
=============================================================================
\* Modification History
\* Last modified Fri Sep 24 20:29:02 CST 2021 by wrz
\* Created Fri Sep 24 16:52:34 CST 2021 by wrz
