import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.ExistenceUniqueness

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure ProjectionMethodPackage {P : VariationalInequalityProblem}
    {VI : VariationalInequalityProblemClosed P}
    {EUP : ExistenceUniquenessPackage VI}
    (EU : ExistenceUniquenessClosed EUP) where
  residualProjection : Prop
  fixedPointEquation : Prop
  convergenceRate : Prop

structure ProjectionMethodEvidence {P : VariationalInequalityProblem}
    {VI : VariationalInequalityProblemClosed P}
    {EUP : ExistenceUniquenessPackage VI}
    {EU : ExistenceUniquenessClosed EUP}
    (PMP : ProjectionMethodPackage EU) where
  residualProjectionClosed : PMP.residualProjection
  fixedPointEquationClosed : PMP.fixedPointEquation
  convergenceRateClosed : PMP.convergenceRate

def ProjectionMethodClosed {P : VariationalInequalityProblem}
    {VI : VariationalInequalityProblemClosed P}
    {EUP : ExistenceUniquenessPackage VI}
    {EU : ExistenceUniquenessClosed EUP}
    (PMP : ProjectionMethodPackage EU) : Prop :=
  PMP.residualProjection ∧ PMP.fixedPointEquation ∧ PMP.convergenceRate

theorem projection_method_closed_from_evidence
    {P : VariationalInequalityProblem} {VI : VariationalInequalityProblemClosed P}
    {EUP : ExistenceUniquenessPackage VI} {EU : ExistenceUniquenessClosed EUP}
    (PMP : ProjectionMethodPackage EU) (E : ProjectionMethodEvidence PMP) :
    ProjectionMethodClosed PMP := by
  exact And.intro E.residualProjectionClosed
    (And.intro E.fixedPointEquationClosed E.convergenceRateClosed)

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse