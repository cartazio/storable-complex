-----------------------------------------------------------------------------
-- |
-- Module      : Data.Array.CArray.Base
-- Copyright   : (c) 2008 Jed Brown
-- License     : BSD-style
-- 
-- Maintainer  : jed@59A2.org
-- Stability   : provisional
-- Portability : portable
--
-- This module provides a Storable instance for Complex which is binary
-- compatible with C99, C++ and Fortran complex data types.  It's only purpose
-- is to provide a standard location for this instance so that other packages
-- needing this instance can play nicely together.
--
-----------------------------------------------------------------------------

module Foreign.Storable.Complex () where

import Data.Complex
import Foreign.Storable
import Foreign.Ptr

-- This Storable instance for Complex is binary compatible with C99, C++ and
-- Fortran complex data types.
instance (RealFloat a, Storable a) => Storable (Complex a) where
    sizeOf z        = 2 * sizeOf (realPart z)
    alignment z     = alignment (realPart z)
    peek p          = do let q = castPtr p
                         r <- peek q
                         i <- peekElemOff q 1
                         return (r :+ i)
    poke p (r :+ i) = do let q = (castPtr p)
                         poke q r
                         pokeElemOff q 1 i
