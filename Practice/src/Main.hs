-----------------------------------------------------------------------------
--
-- Module      :  Main
-- Copyright   :
-- License     :  AllRightsReserved
--
-- Maintainer  :
-- Stability   :
-- Portability :
--
-- |
--
-----------------------------------------------------------------------------

module Main (
    main
) where

-- This strang looking comment adds code only needed when running the
-- doctest tests embedded in the comments
-- $setup
-- >>> import Data.List (stripPrefix)

-- | Simple function to create a hello message.
-- prop> stripPrefix "Hello " (hello s) == Just s

import Graphics.Rendering.OpenGL as GL
import Graphics.UI.GLFW as GLFW

main :: IO ()
main = do
    GLFW.init
    GLFW.defaultWindowHints
    Just win <- GLFW.createWindow 640 480 "GLFW Demo" Nothing Nothing
    GLFW.makeContextCurrent (Just win)
    onDisplay win
    GLFW.destroyWindow win
    GLFW.terminate

onDisplay :: Window -> IO ()
onDisplay win = do
    GL.clearColor $= Color4 1 0 0 1
    GL.clear [ColorBuffer]
    GLFW.swapBuffers win
    onDisplay win
