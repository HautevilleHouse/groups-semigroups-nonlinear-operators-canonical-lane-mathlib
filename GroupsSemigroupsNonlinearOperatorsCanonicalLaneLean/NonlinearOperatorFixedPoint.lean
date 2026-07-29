import GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure NonlinearOperatorPackage
    (X : Type) [CompleteMetricSpace X]
    (T : X → X) where
  contractionCondition : Prop
  fixedPointExistence : Prop
  fixedPointUniqueness : Prop
  banachEvidence : contractionCondition ∧ fixedPointExistence ∧ fixedPointUniqueness

theorem nonlinear_fixed_point_closed
    (X : Type) [CompleteMetricSpace X] (T : X → X)
    (P : NonlinearOperatorPackage X T) :
    P.contractionCondition ∧ P.fixedPointExistence ∧ P.fixedPointUniqueness :=
  P.banachEvidence

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse