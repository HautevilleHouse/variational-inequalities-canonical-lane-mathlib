import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.VariationalInequalityStructure

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure KaramardianEquivalence {V : VariationalInequalityProblem} where
  topologicalDual : Type u
  complementarityProblem : Prop
  equivalenceProof : VariationalInequalityClosed V ↔ complementarityProblem

structure KaramardianEvidence {V : VariationalInequalityProblem}
    (K : KaramardianEquivalence V) where
  equivalenceClosed : VariationalInequalityClosed V ↔ K.complementarityProblem

def KaramardianClosed {V : VariationalInequalityProblem}
    (K : KaramardianEquivalence V) : Prop :=
  VariationalInequalityClosed V ↔ K.complementarityProblem

theorem karamardian_closed_from_evidence {V : VariationalInequalityProblem}
    (K : KaramardianEquivalence V) (E : KaramardianEvidence K) :
    KaramardianClosed K :=
  E.equivalenceClosed

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse