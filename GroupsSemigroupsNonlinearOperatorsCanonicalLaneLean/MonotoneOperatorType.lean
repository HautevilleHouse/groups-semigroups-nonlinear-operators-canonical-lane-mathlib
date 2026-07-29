import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure MonotoneOperator (X : Type u) [NormedAddCommGroup X] [InnerProductSpace ℝ X] where
  domain : Set X
  operator : X → X
  monotone : ∀ x y ∈ domain, Inner.inner (operator x - operator y) (x - y) ≥ 0

def monotoneOperatorClosed (M : MonotoneOperator X) : Prop :=
  M.monotone

structure MonotoneOperatorEvidence (M : MonotoneOperator X) where
  monotoneClosed : M.monotone

theorem monotone_operator_closed_from_evidence (M : MonotoneOperator X) (E : MonotoneOperatorEvidence M) : monotoneOperatorClosed M := by
  exact E.monotoneClosed

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse