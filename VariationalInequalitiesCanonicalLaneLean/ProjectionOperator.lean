import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.VariationalInequalityObject

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure ProjectionOperator (O : VIObjet) where
  projection : O.carrier → O.carrier
  nonexpansive : ∀ x y : O.carrier, ‖projection x - projection y‖ ≤ ‖x - y‖
  fixedPoint : ∀ x : O.carrier, x ∈ O.convexSet ↔ projection x = x
  projectionClosed : nonexpansive ∧ fixedPoint

theorem projection_closed (O : VIObjet) (P : ProjectionOperator O) : P.projectionClosed := by
  exact And.intro P.nonexpansive P.fixedPoint

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse
