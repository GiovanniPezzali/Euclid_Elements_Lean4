import Euclid.I1

namespace Euclid_I2

universe u v

set_option autoImplicit false

theorem I2 {Point : Type u} {Circle : Type v}
(g : Euclid.Geometry Point Circle)
(A B C : Point) (hANotEqualB : A ≠ B) (hBC : g.seg B C) : ∃ L : Point, g.eqs A L B C := by

  have hAB : g.seg A B := g.R7 hANotEqualB
  apply Exists.elim (Euclid_I1.I1 g A B hAB)
  intro D
  intro hEqTri_ABD
  have hTriangleProperties := g.R12b hEqTri_ABD
  have hDA := hTriangleProperties.left
  have hDB := hTriangleProperties.right.left
  have hEqS_DADB := hTriangleProperties.right.right.left
  apply Exists.elim (g.R13a hDB hBC)
  intro H
  intro hExtension
  have hExt_DBH := hExtension.left
  have hGtS_BHBC := hExtension.right.right
  apply Exists.elim (g.R3 hBC)
  intro E
  intro hCircleEProperties
  have hCtr_BE := hCircleEProperties.left
  have hRad_BCE := hCircleEProperties.right
  apply Exists.elim (g.R14a hExt_DBH hGtS_BHBC hRad_BCE)
  intro I
  intro hIntersectionI
  have hInterSC_IDHE := hIntersectionI.left
  have hExt_DBI := hIntersectionI.right
  have hIntersectionPropertiesI := g.R15 hInterSC_IDHE
  have hOnC_IE := hIntersectionPropertiesI.left
  have hDI := hIntersectionPropertiesI.right
  have hBI := g.R13b hExt_DBI
  have hRad_BIE := g.R8a hCtr_BE hOnC_IE hBI
  have hEqS_BIBC := g.R9 hRad_BIE hRad_BCE
  apply Exists.elim (g.R3 hDI)
  intro F
  intro hCircleFProperties
  have hCtr_DF := hCircleFProperties.left
  have hRad_DIF := hCircleFProperties.right
  have hGtS_DIDA := (g.R17a hExt_DBI hEqS_DADB)
  apply Exists.elim (g.R13a hDA hDI)
  intro G
  intro hExtension2
  have hExt_DAG := hExtension2.left
  have hGtS_AGDI := hExtension2.right.right
  have hGtS_DGDI := (g.R17b hExt_DAG hGtS_AGDI)
  apply Exists.elim (g.R14b hExt_DAG hGtS_DGDI hGtS_DIDA hRad_DIF)
  intro L
  intro hIntersectionL
  have hInterSC_LDGF := hIntersectionL.left
  have hExt_DAL := hIntersectionL.right
  have hIntersectionPropertiesL := (g.R15 hInterSC_LDGF)
  have hOnC_LF := hIntersectionPropertiesL.left
  have hDL := hIntersectionPropertiesL.right
  have hRad_DLF := g.R8a hCtr_DF hOnC_LF hDL
  have hEqS_DLDI := g.R9 hRad_DLF hRad_DIF
  have hEqS_ALBI := g.R16 hEqS_DLDI hEqS_DADB hExt_DAL hExt_DBI
  have hEqS_ALBC := g.R10a hEqS_ALBI hEqS_BIBC
  exact Exists.intro L hEqS_ALBC

end Euclid_I2
