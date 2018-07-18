#NoEnv
#Persistent
#SingleInstance Force

SetTitleMatchMode, 2

; From: https://autohotkey.com/board/topic/43079-how-to-automate-windows-to-move-from-one-monitor-to-another/
; Weirdly monitor 1 == 0, so we skip it
SysGet, Mon0, Monitor, 0 ; get the co-ordinates of the first monitor
SysGet, Mon2, Monitor, 2 ; get the co-ordinates of the second monitor
SysGet, Mon3, Monitor, 3 ; get the co-ordinates of the third monitor

; MsgBox, Left: %Mon0Left% -- Top: %Mon0Top% -- Right: %Mon0Right% -- Bottom %Mon0Bottom%.
; MsgBox, Left: %Mon2Left% -- Top: %Mon2Top% -- Right: %Mon2Right% -- Bottom %Mon2Bottom%.
; MsgBox, Left: %Mon3Left% -- Top: %Mon3Top% -- Right: %Mon3Right% -- Bottom %Mon3Bottom%.


arrWindows := { OUTLOOK: 3, chrome: 2 }
intOffset = 62 ; Width of left taskbar
arrPos := [ Mon0Left, Mon2Left, Mon3Left ]
; arrPos := { 1: 0, 2: 1366, 3: 3286 }

for strExe, intMon in arrWindows
{
    WinGet, arrFound, list, ahk_exe %strExe%.exe

    i := 1
    Loop
    {
        idWin = % arrFound%i%

        WinActivate, ahk_id %idWin%
        WinRestore, ahk_id %idWin%
        WinSet, Style, 0x40000
        WinSet, Redraw
        WinMove, ahk_id %idWin%, , arrPos[intMon] + intOffset, 0
        WinMaximize, ahk_id %idWin%

        i++
    }
    Until i = arrFound+1

}
