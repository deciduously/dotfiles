import XMonad
import XMonad.Config.Desktop

baseConfig = desktopConfig

main = xmonad def
     { terminal          = myTerminal
     , modMask           = myModMask
     }

myTerminal          = "urxvt"
myModMask           = mod4Mask
