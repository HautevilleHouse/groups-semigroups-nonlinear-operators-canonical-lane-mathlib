import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure SemigroupPackage where
  carrier : Type u
  operation : carrier → carrier → carrier
  associativity : ∀ a b c, operation (operation a b) c = operation a (operation b c)
  representation : Type v
  representationMap : carrier → representation
  homomorphismProperty : ∀ a b, representationMap (operation a b) = (representationMap a) * (representationMap b)

structure SemigroupEvidence (S : SemigroupPackage) where
  associativityClosed : S.associativity
  homomorphismPropertyClosed : S.homomorphismProperty

def SemigroupClosed (S : SemigroupPackage) : Prop :=
  S.associativity ∧ S.homomorphismProperty

theorem semigroup_closed_from_evidence (S : SemigroupPackage) (E : SemigroupEvidence S) : SemigroupClosed S := by
  exact And.intro E.associativityClosed E.homomorphismPropertyClosed

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse