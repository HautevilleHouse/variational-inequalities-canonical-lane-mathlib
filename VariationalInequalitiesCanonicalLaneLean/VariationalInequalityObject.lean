import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure VIObjet where
  carrier : Type
  topology : TopologicalSpace carrier
  bilinearForm : carrier → carrier → ℝ
  convexSet : Set carrier
  convexClosed : Convex ℝ convexSet ∧ IsClosed convexSet
  dualOperator : carrier → carrier
  monotone : Prop
  pseudomonotone : Prop
  hemicontinuous : Prop
  coerciive : Prop
  conclusion : ∃ u : carrier, u ∈ convexSet ∧ ∀ v : carrier, v ∈ convexSet → bilinearForm u (v - u) ≥ 0

def VIClosed (O : VIObjet) : Prop :=
  O.conclusion

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse
