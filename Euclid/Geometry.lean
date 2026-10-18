namespace Euclid

universe u v

set_option autoImplicit false

structure Geometry (Point : Type u) (Circle : Type v) where

  seg : Point → Point → Prop
  ctr : Point → Circle → Prop
  onc : Point → Circle → Prop
  tri : Point → Point → Point → Prop
  ext : Point → Point → Point → Prop
  rad : Point → Point → Circle → Prop
  eqtri : Point → Point → Point → Prop
  intercc : Point → Circle → Circle → Prop
  eqs : Point → Point → Point → Point → Prop
  gts : Point → Point → Point → Point → Prop
  intersc : Point → Point → Point → Circle → Prop

  R2 : ∀ {x y : Point}, seg x y → seg y x ∧ eqs x y y x
  R3 : ∀ {x y : Point}, seg x y → ∃ (f : Circle), ctr x f ∧ rad x y f
  R4 : ∀ {x y : Point}, ∀ {e f : Circle}, rad x y e → rad y x f → ∃ (z w : Point), (x ≠ z ∧ y ≠ z ∧ x ≠ w ∧ y ≠ w ∧ z ≠ w) ∧ intercc z e f ∧ intercc w e f
  R5 : ∀ {z : Point}, ∀ {e f : Circle}, intercc z e f → onc z e ∧ onc z f
  R7 : ∀ {x y : Point}, ¬(x = y) → seg x y
  R8a : ∀ {e : Circle}, ∀ {x z : Point}, ctr x e → onc z e → seg x z → rad x z e
  R9 : ∀ {x y z : Point}, ∀ {e : Circle}, rad x y e → rad x z e → eqs x y x z
  R10a : ∀ {x y w z u v : Point}, eqs x y w z → eqs w z u v → eqs x y u v
  R11a : ∀ {x y z : Point}, ∀ {e f : Circle}, rad x y e → rad y x f → intercc z e f → seg x y → seg x z → seg y z → tri x y z
  R12a : ∀ {x y z : Point}, tri x y z → eqs x y x z → eqs x y y z → eqtri x y z
  R12b : ∀ {x y z : Point}, eqtri x y z → seg z x ∧ seg z y ∧ eqs z x z y ∧ eqs z y y x
  R13a : ∀ {x y u v : Point}, seg x y → seg u v → ∃ (z : Point), ext x y z ∧ seg x z ∧ gts y z u v
  R13b : ∀ {x y z : Point}, ext x y z → seg y z
  R14a : ∀ {x y z u : Point}, ∀ {e : Circle}, ext x y z → gts y z y u → rad y u e → ∃ (r : Point), intersc r x z e ∧ ext x y r
  R14b : ∀ {x y z u : Point}, ∀ {e : Circle}, ext x y z → gts x z x u → gts x u x y → rad x u e → ∃ (r : Point), intersc r x z e ∧ ext x y r
  R15 : ∀ {r x z : Point}, ∀ {e : Circle}, intersc r x z e → onc r e ∧ seg x r
  R16 : ∀ {x y z w u v : Point}, eqs x z u w → eqs x y u v → ext x y z → ext u v w → eqs y z v w
  R17a : ∀ {x y z u v : Point}, ext x y z → eqs u v x y → gts x z u v
  R17b : ∀ {x y z u v : Point}, ext x y z → gts y z u v → gts x z u v

end Euclid
