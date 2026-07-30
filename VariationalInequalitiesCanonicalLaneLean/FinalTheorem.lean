import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

def ConstrainedVariationalInequalityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_variational_inequality_endgame (A : AdmissibleClass) :
    ConstrainedVariationalInequalityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse