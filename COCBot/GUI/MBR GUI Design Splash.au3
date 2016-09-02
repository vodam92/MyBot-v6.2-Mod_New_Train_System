; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Splash
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: mikemikemikecoc (2016
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================


; Splash Variables
Global $hSplash = 0, $hSplashProgress, $lSplashStatus, $lSplashTitle
Global $iTotalSteps = 10, $iCurrentStep = 0

#Region Splash

Local $sSplashImg = @ScriptDir & "\Images\logo.jpg"
Local $hImage, $iX, $iY
Local $iT = 20 ; Top of logo (additional space)
Local $iB = 10 ; Bottom of logo (additional space)

If $ichkDisableSplash = 0 Then
    _GDIPlus_Startup()

    ; Determine dimensions of splash image
    $hImage = _GDIPlus_ImageLoadFromFile($sSplashImg)
    $iX = _GDIPlus_ImageGetWidth($hImage)
    $iY = _GDIPlus_ImageGetHeight($hImage)

    ; Cleanup GDI resources
    _GDIPlus_ImageDispose($hImage)
    _GDIPlus_Shutdown()

    ; Create Splash container
    $hSplash = GUICreate("", $iX, $iY + $iT + $iB + 60, -1, -1, BitOR($WS_POPUP, $WS_BORDER), BitOR($WS_EX_TOPMOST, $WS_EX_WINDOWEDGE, $WS_EX_TOOLWINDOW))
	GUISetBkColor($COLOR_WHITE, $hSplash)

    GUICtrlCreatePic($sSplashImg, 0, $iT, $iX, $iY) ; Splash Image
    $lSplashTitle = GUICtrlCreateLabel($sBotTitle, 15, $iY + $iT + $iB + 3, $iX - 30, 15, $SS_CENTER) ; Splash Title
    $hSplashProgress = GUICtrlCreateProgress(15, $iY + $iT + $iB + 20, $iX - 30, 10, $PBS_SMOOTH, BitOR($WS_EX_TOPMOST, $WS_EX_WINDOWEDGE, $WS_EX_TOOLWINDOW)) ; Splash Progress
    $lSplashStatus = GUICtrlCreateLabel("", 15, $iY + $iT + $iB + 38, $iX - 30, 15, $SS_CENTER) ; Splash Title

    ; Show Splash
    GUISetState(@SW_SHOWNOACTIVATE, $hSplash)
EndIf

#EndRegion