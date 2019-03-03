
; NEEDS '*' because LCtrl key-repeat is otherwise interpreted as ALT+LCtrl.
;*LCtrl::
;   CtrlTabbed := false
;    Hotkey, *Tab, CtrlTab, On   ; Begin Ctrl+Tab (and release Alt) when we press Tab.
;    Send {Alt Down}             ; Press Alt (LCtrl::Alt)
;    KeyWait, LCtrl
;    if CtrlTabbed	
;        Send {Ctrl Up}          ; Release Ctrl after Ctrl+Tabbing.
;    else
;        Send {Alt Up}           ; Release Alt (LCtrl::Alt)
;    Hotkey, *Tab, CtrlTab, Off
;return

;CtrlTab:
;    if (!CtrlTabbed) {
;        Send {Alt Up}           ; Release Alt now.
;        Send {Ctrl Down}        ; Press down Ctrl.
;        CtrlTabbed := true      ; Set a flag so we know to release Ctrl instead of Alt.
;    }
;    Send {Blind}{Tab}           ; Press Tab without releasing any modifiers.
;return

; If you want LCtrl and LAlt to both do Alt+Tab, replace all of the above with:
; LCtrl::Alt


; NEEDS '*' because LAlt key-repeat is otherwise interpreted as CTRL+LAlt.
*LAlt::
    AltTabbed := false
    Hotkey, *Tab, AltTab, On    ; Begin Alt+Tab (and release Ctrl) when we press Tab.
    Send {Ctrl Down}            ; Press Ctrl (LAlt::Ctrl)
    KeyWait, LAlt
    if AltTabbed
        Send {Alt Up}           ; Release Alt after Alt+Tabbing.
    else
        Send {Ctrl Up}          ; Release Ctrl (LAlt::Ctrl)
    Hotkey, *Tab, AltTab, Off
return

AltTab:
    if (!AltTabbed) {
        Send {Ctrl Up}          ; Release Ctrl now.
        Send {Alt Down}         ; Press down Alt. (Keeps the Alt+Tab menu open.)
        AltTabbed := true       ; Set a flag so we know to release Alt instead of Ctrl.
    }
    Send {Blind}{Tab}           ; Press Tab without releasing any modifiers.
return


CapsLock::Enter 
!s::Send {Alt Up}{Ctrl Up} ^{s  }
^w::Send {Ctrl Up}^{F4}{Ctrl Down}
return
^q::Send {Ctrl Up}!{F4}{Ctrl Down}
return 
!BackSpace::Send {Ctrl Up}{Del}
return 
^BackSpace::Send {Ctrl Up}{Del}
return
^1::Send {Ctrl Up}Debug.Log("{!}{!}{^}{!}{!} ");{left}{left}{left}
return
^2::Send {Ctrl Up}Debug.Break();
return
+^1::Send {Ctrl Up}console.info("{!}{!}{^}{!}{!} ");{left}{left}{left}
return
+^z::Send {Ctrl Up}^{y}{Ctrl Down}
return
^Right::Send {Ctrl Up}{End}{Ctrl Down}
return
+^Right::Send {Ctrl Up}+{End}{Ctrl Down}
return
^Left::Send {Ctrl Up}{Home}{Ctrl Down}
return
+^Left::Send {Ctrl Up}+{Home}{Ctrl Down}
return
^Space::Send {Ctrl Up}{LWin}
return
^#::Send {Ctrl Up}{LWin}
return

SetTitleMatchMode, 2
#IfWinActive frontend - Microsoft Visual Studio
F5::WinActivate, Unity
return

#IfWinActive frontend [
F5::
ControlSend,, ^{p}, Unity
WinActivate, Unity
return
F4::
Send {F3}
ControlSend,, ^{p}, Unity
WinActivate, Unity
return

#IfWinActive Unity
F5::Send ^p
return
#IfWinActive
