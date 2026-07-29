import GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure SemigroupDecompositionPackage
    (M : Type) [Semigroup M] (X : Type) (A : SemigroupAction M X) where
  greenClasses : Type
  principalIdeals : Prop
  jClassesClassified : Prop
  decompositionEvidence : principalIdeals ∧ jClassesClassified

theorem semigroup_decomposition_closed
    (M : Type) [Semigroup M] (X : Type) (A : SemigroupAction M X)
    (P : SemigroupDecompositionPackage M X A) :
    P.principalIdeals ∧ P.jClassesClassified :=
  P.decompositionEvidence

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse