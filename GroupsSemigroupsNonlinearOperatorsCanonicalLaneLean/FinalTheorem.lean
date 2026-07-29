import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.MildSolution
import HautevilleHouse.GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

def ConstrainedNonlinearOperatorSemigroupClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_nonlinear_operator_semigroup_endgame (A : AdmissibleClass) :
    ConstrainedNonlinearOperatorSemigroupClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse