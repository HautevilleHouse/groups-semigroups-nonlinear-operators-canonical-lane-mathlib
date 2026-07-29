import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure NonlinearOperatorPackage where
  domain : Type u
  codomain : Type u
  operator : domain → codomain
  bounded : Prop
  continuous : Prop
  demicontinuous : Prop
  monotone : Prop
  maximalMonotone : Prop

structure NonlinearOperatorEvidence (N : NonlinearOperatorPackage) where
  boundedClosed : N.bounded
  continuousClosed : N.continuous
  demicontinuousClosed : N.demicontinuous
  monotoneClosed : N.monotone
  maximalMonotoneClosed : N.maximalMonotone

def NonlinearOperatorClosed (N : NonlinearOperatorPackage) : Prop :=
  N.bounded ∧ N.continuous ∧ N.demicontinuous ∧ N.monotone ∧ N.maximalMonotone

theorem nonlinear_operator_closed_from_evidence (N : NonlinearOperatorPackage) (E : NonlinearOperatorEvidence N) : NonlinearOperatorClosed N := by
  exact And.intro E.boundedClosed (And.intro E.continuousClosed (And.intro E.demicontinuousClosed (And.intro E.monotoneClosed E.maximalMonotoneClosed)))

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse