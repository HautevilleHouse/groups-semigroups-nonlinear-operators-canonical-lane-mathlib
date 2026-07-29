import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure NonlinearOperatorSemigroupPackage where
  space : Type u
  op : space → space → space
  semigroupAssoc : ∀ a b c : space, op (op a b) c = op a (op b c)
  operator : space → space → space
  operatorHom : ∀ a b c : space, operator (op a b) c = op (operator a c) (operator b c)

structure NonlinearOperatorSemigroupEvidence (P : NonlinearOperatorSemigroupPackage) where
  semigroupAssocClosed : P.semigroupAssoc
  operatorHomClosed : P.operatorHom

def NonlinearOperatorSemigroupClosed (P : NonlinearOperatorSemigroupPackage) : Prop :=
  P.semigroupAssoc ∧ P.operatorHom

theorem nonlinear_operator_semigroup_closed_from_evidence
    (P : NonlinearOperatorSemigroupPackage)
    (E : NonlinearOperatorSemigroupEvidence P) :
    NonlinearOperatorSemigroupClosed P := by
  exact And.intro E.semigroupAssocClosed E.operatorHomClosed

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse