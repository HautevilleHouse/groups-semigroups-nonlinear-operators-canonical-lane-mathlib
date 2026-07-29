import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Algebra.Group.Basic
import Mathlib.Functor.Action

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure SemigroupAction (M : Type) [Semigroup M] (X : Type) where
  act : M → X → X
  mul_act : ∀ (a b : M) (x : X), act (a * b) x = act a (act b x)

structure AdmittedObject where
  domain : Type
  codomain : Type
  operator : SemigroupAction domain codomain
  conclusion : True

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse