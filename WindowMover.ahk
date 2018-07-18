#NoEnv
#Persistent
#SingleInstance Force

SetTitleMatchMode, 2

; Retrieve size and coords of each screen
; Weirdly monitor 1 == 0, so we skip it
SysGet, Mon0, Monitor, 0
SysGet, Mon2, Monitor, 2
SysGet, Mon3, Monitor, 3
arrPos := [ Mon0Left, Mon2Left, Mon3Left ]

; Config which programs you want on which monitor, where 1 = left-most
arrWindows := { OUTLOOK: 3, chrome: 2 }

; Drink the potion, GUMMY BEEEEARS!
; Window window boing boing
for strExe, intMon in arrWindows
{
    ; Find all windows of each defined exe
    WinGet, arrFound, list, ahk_exe %strExe%.exe

    ; Iterate over found windows and move them to specified screen
    i := 1
    Loop
    {
        ; Have to compile this outside each command due to AHK's weird interpreter
        idWin = % arrFound%i%

        ; Such move. Much maximize. Wow.
        WinActivate, ahk_id %idWin%
        WinRestore, ahk_id %idWin%
        WinSet, Style, 0x40000
        WinSet, Redraw
        WinMove, ahk_id %idWin%, , arrPos[intMon], 0
        WinMaximize, ahk_id %idWin%

        i++
    }

    Until i = arrFound+1
}
