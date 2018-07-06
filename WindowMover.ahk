#NoEnv
#Persistent
#SingleInstance Force

SetTitleMatchMode, 2

; From: https://autohotkey.com/board/topic/43079-how-to-automate-windows-to-move-from-one-monitor-to-another/
SysGet, Mon2, Monitor, 2 ; get the co-ordinates of the second monitor
; move the window to Mon2Left+X, Mon2Top+Y. 