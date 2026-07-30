import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.ProjectionOperator

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure RegularizationPackage (O : VIObjet) (P : ProjectionOperator O) where
  regularizedMap : O.carrier → O.carrier
  contractionFactor : ℝ
  contraction : 0 < contractionFactor ∧ contractionFactor < 1
  fixedPointEquivalence : ∀ x : O.carrier, regularizedMap x = x ↔ x ∈ O.convexSet
  regularizationClosed : contraction ∧ fixedPointEquivalence

theorem regularization_closed (O : VIObjet) (P : ProjectionOperator O) (R : RegularizationPackage O P) : R.regularizationClosed := by
  exact And.intro R.contraction R.fixedPointEquivalence

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse
