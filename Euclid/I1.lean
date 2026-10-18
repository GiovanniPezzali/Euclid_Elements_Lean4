import Euclid.Geometry

namespace Euclid_I1

universe u v

set_option autoImplicit false

theorem R4_OneIntersection {Point : Type u} {Circle : Type v}
  (g : Euclid.Geometry Point Circle) {x y : Point} {e f : Circle}
  (hRad_XYE : g.rad x y e) (hRad_YXF : g.rad y x f) : ∃ (z : Point),
   x ≠ z ∧ y ≠ z ∧ g.intercc z e f := by

  apply Exists.elim (g.R4 hRad_XYE hRad_YXF)
  intro z hExistsW
  apply Exists.elim hExistsW
  intro w hR4Properties
  have hXNotEqualZ := hR4Properties.left.left
  have hYNotEqualZ := hR4Properties.left.right.left
  have hInterCC_ZEF := hR4Properties.right.left
  exact Exists.intro z
   (And.intro hXNotEqualZ
   (And.intro hYNotEqualZ hInterCC_ZEF))

theorem I1 {Point : Type u} {Circle : Type v}
 (g : Euclid.Geometry Point Circle) (A B : Point) (hAB : g.seg A B) :
  ∃ (C : Point), g.eqtri A B C := by

  have hSegmentABProperties := g.R2 hAB
  have hBA := hSegmentABProperties.left
  have hEqS_ABBA := hSegmentABProperties.right
  apply Exists.elim (g.R3 hAB)
  intro E hCircleEProperties
  apply Exists.elim (g.R3 hBA)
  intro F hCircleFProperties
  have hRad_ABE := hCircleEProperties.right
  have hRad_BAF := hCircleFProperties.right
  have hCtr_AE := hCircleEProperties.left
  have hCtr_BF := hCircleFProperties.left
  apply Exists.elim (R4_OneIntersection g hRad_ABE hRad_BAF)
  intro C hIntersectionCProperties
  have hANotEqualC := hIntersectionCProperties.left
  have hBNotEqualC := hIntersectionCProperties.right.left
  have hInterCC_CEF := hIntersectionCProperties.right.right
  have hCircleIntersectionProperties := (g.R5 hInterCC_CEF)
  have hOnC_CE := hCircleIntersectionProperties.left
  have hOnC_CF := hCircleIntersectionProperties.right
  have hAC := (g.R7 hANotEqualC)
  have hBC := (g.R7 hBNotEqualC)
  have hRad_ACE := (g.R8a hCtr_AE hOnC_CE hAC)
  have hRad_BCF := (g.R8a hCtr_BF hOnC_CF hBC)
  have hEqS_ABAC := (g.R9 hRad_ABE hRad_ACE)
  have hEqS_BABC := (g.R9 hRad_BAF hRad_BCF)
  have hEqS_ABBC := (g.R10a hEqS_ABBA hEqS_BABC)
  have hTri_ABC := (g.R11a hRad_ABE hRad_BAF hInterCC_CEF hAB hAC hBC)
  have hEqTri_ABC := (g.R12a hTri_ABC hEqS_ABAC hEqS_ABBC)
  exact Exists.intro C hEqTri_ABC

end Euclid_I1
