import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

base = desktopConfig

main = do
  xmproc <- spawnPipe "xmobar"

  xmonad $ base
    { manageHook = manageDocks <+> manageHook base
    , layoutHook = avoidStruts $ layoutHook base
    , logHook = dynamicLogWithPP xmobarPP
                  { ppOutput = hPutStrLn xmproc
                  , ppTitle = shorten 21
                  }
    , terminal          = myTerminal
    , modMask           = myModMask
    } `additionalKeys`
    [ ((myModMask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
    , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
    , ((0, xK_Print), spawn "scrot")
    , ((myModMask, xK_g), spawn "chromium")
    , ((myModMask, xK_t), spawn "emacsclient -c &")
    , ((myModMask, xK_n), spawn "pcmanfm-qt")
    ]

myTerminal          = "urxvt"
myModMask           = mod4Mask
