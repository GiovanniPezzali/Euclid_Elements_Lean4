# Euclid's Elements — Formalization in Lean 4

## Project Overview

This repository contains a formalization of Propositions I.1 and I.2
of Euclid's *Elements*, developed using the Lean 4 proof assistant.

The project was developed as part of my Master's thesis in Logic and
Philosophy of Mathematics at the University of Verona.

Its main objective is to investigate the logical structure of Euclidean
demonstrations by translating their inferential steps into a formal
deductive system, making assumptions, inference rules, and logical
dependencies explicit.

## Project Structure

The project consists of three main Lean files:

- **Geometry.lean** — Defines the formal geometric framework,
  including primitive relations and inference rules.

- **I1.lean** — Formalizes Proposition I.1, concerning the construction
  of an equilateral triangle on a given segment.

- **I2.lean** — Formalizes Proposition I.2, concerning the construction
  of a segment equal in length to a given segment, starting from a
  given point.

The formalization of I.2 directly invokes the previously established
theorem I.1, explicitly representing the logical dependency between
the two propositions.

## Formalization Methodology

The proofs follow a natural deduction-oriented approach, implemented
through explicit Lean 4 tactics.

Particular attention is devoted to the logical structure of the
demonstrations, the application of inference rules, and the management
of existential quantifiers.

The formalizations contain no `sorry` or `admit` placeholders.

The geometric framework relies on explicitly stated assumptions and
inference rules, whose theoretical justification and methodological
context are discussed in the accompanying Master's thesis.

The current proof of I.2 assumes that the starting point is distinct
from one endpoint of the given segment.

## Technical Information

- **Language:** Lean 4
- **Version:** 4.34.0
- **Build system:** Lake
- **Research areas:** Formal Logic, Proof Verification,
  Foundations of Mathematics

To build the project, install Lean 4 and Lake using the toolchain
specified in `lean-toolchain`, then run:

    lake build

from the project's root directory.

## Acknowledgments

I would like to express my sincere gratitude to Fabio Aurelio D'Asaro,
my Master's thesis supervisor, for his guidance and support throughout
this research project.

I am particularly grateful to him for sharing his earlier Lean
formalization of Proposition I.1, which provided a valuable starting
point for my study and subsequent rewriting of the proof.

The formalization of Proposition I.2 is based on the deductive
reconstruction developed for my Master's thesis.

---

**Author:** Giovanni Pezzali

**Institution:** University of Verona, Italy

**Year:** 2026
