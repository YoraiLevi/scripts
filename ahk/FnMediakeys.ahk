﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; AutoHotkey Media Keys
;^!Space::Send       {Media_Play_Pause}
;^!Left::Send        {Media_Prev}
;^!Right::Send       {Media_Next}
F1::Volume_Mute
F2::Volume_Down
F3::Volume_Up
SC163 & Volume_Mute::F1
SC163 & Volume_Down::F2
SC163 & Volume_Up::F3