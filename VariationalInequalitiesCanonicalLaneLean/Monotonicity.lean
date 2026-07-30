import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.VariationalInequalityObject

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure MonotonicityPackage (O : VIObjet) where
  monotoneCondition : O.monotone
  pseudomonotoneImplies : O.pseudomonotone
  hemicontinuousCondition : O.hemicontinuous
  coercivityCondition : O.coercive
  monotonicityClosed : monotoneCondition ∧ pseudomonotoneImplies ∧ hemicontinuousCondition ∧ coercivityCondition

theorem monotonicity_closed (O : VIObjet) (M : MonotonicityPackage O) : M.monotonicityClosed := by
  exact And.intro M.monotoneCondition (And.intro M.pseudomonotoneImplies (And.intro M.hemicontinuousCondition M.coercivityCondition))

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse
