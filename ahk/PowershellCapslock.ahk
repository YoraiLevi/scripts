#Include env.ahk

;Returns the path of the specified Explorer window, or the path of the active Explorer window if
;a title is not specified. Works with Explorer windows, desktop and some open/save dialogues.
;Returns empty path if no path is retrieved.

ActiveFolderPath(WinTitle="A")
{
    WinGetClass Class, %WinTitle%
    If (Class ~= "Progman|WorkerW") ;desktop
        WinPath := A_Desktop
    ;Else If (Class ~= "(Cabinet|Explore)WClass") ;all other Explorer windows
    Else ;all other windows
    {
        WinGetText, WinPath, A
        RegExMatch(WinPath, "Address:.*", WinPath)
        WinPath := RegExReplace(WinPath, "Address: ") ;remove "Address: " part
    }

    WinPath := RegExReplace(WinPath, "\\+$") ;remove single or double  trailing backslash
    If WinPath ;if path not empty, append single backslash
        WinPath .= "\"
    Return WinPath
}

CapsLock::
path := ActiveFolderPath(), path = ((path ? path : "C:\Source\repos\"))
Run, C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe , %path%
Return
#CapsLock::Run,*RunAs C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe,,UseErrorLevel
^!+CapsLock::CapsLock