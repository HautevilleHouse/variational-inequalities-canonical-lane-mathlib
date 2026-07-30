import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure MonotoneOperatorsPackage where
  operatorType : Type u
  domain : Type v
  monotonicity : Prop
  hemicontinuity : Prop
  maximalMonotone : Prop

structure MonotoneOperatorsEvidence (M : MonotoneOperatorsPackage) where
  monotonicityClosed : M.monotonicity
  hemicontinuityClosed : M.hemicontinuity
  maximalMonotoneClosed : M.maximalMonotone

def MonotoneOperatorsClosed (M : MonotoneOperatorsPackage) : Prop :=
  M.monotonicity ∧ M.hemicontinuity ∧ M.maximalMonotone

theorem monotone_operators_closed_from_evidence (M : MonotoneOperatorsPackage) (E : MonotoneOperatorsEvidence M) :
    MonotoneOperatorsClosed M := by
  exact And.intro E.monotonicityClosed (And.intro E.hemicontinuityClosed E.maximalMonotoneClosed)

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse