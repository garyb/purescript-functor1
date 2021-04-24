module Data.Functor1 where

import Prelude

class Functor1 ∷ ∀ k. ((k → Type) → Type) → Constraint
class Functor1 t where
  map1 ∷ ∀ f g. (f ~> g) → t f → t g
