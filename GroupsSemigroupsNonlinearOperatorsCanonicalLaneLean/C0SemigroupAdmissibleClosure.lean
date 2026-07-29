import NonlinearOperatorAdmissibleClass

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure C0SemigroupAdmissible where
  tikhonovSpace : Type
  semigroupAction : ℝ → (tikhonovSpace → tikhonovSpace)
  isLinear : Prop
  strongContinuity : ∀ x : tikhonovSpace, Continuous (λ t : ℝ => semigroupAction t x)

def C0SemigroupClosed (S : C0SemigroupAdmissible) : Prop :=
  S.isLinear ∧ S.strongContinuity

theorem c0_semigroup_closed_from_admissible (S : C0SemigroupAdmissible) : C0SemigroupClosed S :=
  And.intro S.isLinear S.strongContinuity

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse
