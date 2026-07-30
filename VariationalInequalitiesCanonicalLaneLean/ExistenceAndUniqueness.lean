import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.VariationalInequalityFormulation

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure ExistenceAndUniquenessPackage (VI : VariationalInequality X) where
  existence : ∃ x : X, VI.solution x
  uniqueness : ∀ x y : X, VI.solution x → VI.solution y → x = y
  monotonicityCondition : ∀ x y : X, Inner (VI.F x - VI.F y) (x - y) ≥ 0

structure ExistenceAndUniquenessEvidence (VI : VariationalInequality X) (P : ExistenceAndUniquenessPackage VI) where
  existenceClosed : P.existence
  uniquenessClosed : P.uniqueness
  monotonicityConditionClosed : P.monotonicityCondition

def ExistenceAndUniquenessClosed (VI : VariationalInequality X) (P : ExistenceAndUniquenessPackage VI) : Prop :=
  P.existence ∧ P.uniqueness ∧ P.monotonicityCondition

theorem existence_and_uniqueness_closed_from_evidence (VI : VariationalInequality X) (P : ExistenceAndUniquenessPackage VI) (E : ExistenceAndUniquenessEvidence VI P) :
    ExistenceAndUniquenessClosed VI P := by
  exact And.intro E.existenceClosed (And.intro E.uniquenessClosed E.monotonicityConditionClosed)

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse