#Include ENV.ahk
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