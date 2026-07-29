import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.NonlinearOperatorSemigroup

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure SemigroupActionPackage (N : NonLinearSemigroupPackage) (X : Type u) where
  act : N.carrier → X → X
  compat : ∀ a b x, act (N.op a b) x = act a (act b x)
  continuityInFirst : Prop
  continuityInSecond : Prop
  compatTerm : compat
  continuityInFirstTerm : continuityInFirst
  continuityInSecondTerm : continuityInSecond

structure SemigroupActionEvidence {N : NonLinearSemigroupPackage} {X : Type u} (A : SemigroupActionPackage N X) where
  compatClosed : A.compat
  continuityInFirstClosed : A.continuityInFirst
  continuityInSecondClosed : A.continuityInSecond

def SemigroupActionClosed {N : NonLinearSemigroupPackage} {X : Type u} (A : SemigroupActionPackage N X) : Prop :=
  A.compat ∧ A.continuityInFirst ∧ A.continuityInSecond

theorem semigroup_action_closed_from_evidence
    {N : NonLinearSemigroupPackage} {X : Type u} (A : SemigroupActionPackage N X) (E : SemigroupActionEvidence A) :
    SemigroupActionClosed A := by
  exact And.intro E.compatClosed (And.intro E.continuityInFirstClosed E.continuityInSecondClosed)

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse