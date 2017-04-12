import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "xmobar"

  xmonad $ def
    { manageHook = manageDocks <+> manageHook def
    , layoutHook = avoidStruts $ layoutHook def
    , logHook = dynamicLogWithPP xmobarPP
                  { ppOutput = hPutStrLn xmproc
                  , ppTitle = xmobarColor "green" "" . shorten 50
                  }
    , terminal          = myTerminal
    , modMask           = myModMask
    } `additionalKeys`
    [ ((myModMask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
    , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
    , ((0, xK_Print), spawn "scrot")
    , ((myModMask, xK_g), spawn "chromium")
    , ((myModMask, xK_t), spawn "emacsclient -c &")
    ]

myTerminal          = "urxvt"
myModMask           = mod4Mask
