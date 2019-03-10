module Data.Identity1 where

import Prelude

import Data.Foldable1 (class Foldable1)
import Data.Functor1 (class Functor1)
import Data.Traversable1 (class Traversable1)

data Identity1 f = Identity1 (∀ r. (∀ a. f a → r) → r)

mkIdentity1 ∷ ∀ f a. f a → Identity1 f
mkIdentity1 a = Identity1 \f → f a

instance functor1Identity1 ∷ Functor1 Identity1 where
  map1 f (Identity1 g) = g \a → Identity1 \h → h (f a)

instance foldable1Identity1 ∷ Foldable1 Identity1 where
  foldMap1 f (Identity1 g) = g f

instance traversable1Identity1 ∷ Traversable1 Identity1 where
  traverse1 f (Identity1 g) = g \a → mkIdentity1 <$> f a
