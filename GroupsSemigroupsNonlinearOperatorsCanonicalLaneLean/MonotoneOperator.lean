import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.NonlinearOperatorSemigroup

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure MonotoneOperatorPackage {N : NonLinearSemigroupPackage} where
  domain : N.carrier → Prop
  range : N.carrier → Prop
  monotonicity : ∀ x y, domain x → domain y → N.op x y ∈ range → N.op y x ∈ range
  monotonicityTerm : monotonicity

structure MonotoneOperatorEvidence {N : NonLinearSemigroupPackage} (M : MonotoneOperatorPackage N) where
  monotonicityClosed : M.monotonicity

def MonotoneOperatorClosed {N : NonLinearSemigroupPackage} (M : MonotoneOperatorPackage N) : Prop :=
  M.monotonicity

theorem monotone_operator_closed_from_evidence
    {N : NonLinearSemigroupPackage} (M : MonotoneOperatorPackage N) (E : MonotoneOperatorEvidence M) :
    MonotoneOperatorClosed M := by
  exact E.monotonicityClosed

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse