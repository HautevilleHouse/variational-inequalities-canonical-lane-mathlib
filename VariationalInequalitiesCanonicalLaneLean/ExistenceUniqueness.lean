import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.VariationalInequalityProblem

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure ExistenceUniquenessPackage {P : VariationalInequalityProblem}
    (VI : VariationalInequalityProblemClosed P) where
  solutionExists : Prop
  solutionUnique : Prop
  solutionRegularity : Prop

structure ExistenceUniquenessEvidence {P : VariationalInequalityProblem}
    {VI : VariationalInequalityProblemClosed P}
    (EUP : ExistenceUniquenessPackage VI) where
  solutionExistsClosed : EUP.solutionExists
  solutionUniqueClosed : EUP.solutionUnique
  solutionRegularityClosed : EUP.solutionRegularity

def ExistenceUniquenessClosed {P : VariationalInequalityProblem}
    {VI : VariationalInequalityProblemClosed P}
    (EUP : ExistenceUniquenessPackage VI) : Prop :=
  EUP.solutionExists ∧ EUP.solutionUnique ∧ EUP.solutionRegularity

theorem existence_uniqueness_closed_from_evidence
    {P : VariationalInequalityProblem} {VI : VariationalInequalityProblemClosed P}
    (EUP : ExistenceUniquenessPackage VI) (E : ExistenceUniquenessEvidence EUP) :
    ExistenceUniquenessClosed EUP := by
  exact And.intro E.solutionExistsClosed
    (And.intro E.solutionUniqueClosed E.solutionRegularityClosed)

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse