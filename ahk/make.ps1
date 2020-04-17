# compile and create startup links for scripts
# ahks to compile
[array]$scripts = @("FnFixer.ahk","Capslock.ahk","TTS.ahk")


# compiler location
$ahk2exe = 'C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe'
    $startup = $env:USERPROFILE + "\Start Menu\Programs\Startup\"
$bin = "bin"
# shell to create shortcut
$objShell = New-Object -ComObject ("WScript.Shell")

$bin = $pwd.Path + "\" + $bin + "\"
# 
$scripts | ForEach-Object {
    $exe = $_.replace(".ahk", ".exe")
    Stop-Process -Name $exe.replace(".exe", "") -ErrorAction SilentlyContinue
    Start-Process -FilePath $ahk2exe -ArgumentList "/in $_ /out $bin$exe" -Wait
}-End {
    #cleaning ahk scripts from autostart
    $startup | Get-ChildItem -File | where {$_ -like "Ahk*"} | ForEach-Object {
        Remove-Item $startup$_
    }
    # finally create links and autostart the exe's
     $bin | Get-ChildItem | where { $_.name -like "*.exe" } | foreach {
        $exe = $_.name
        $lnk = "Ahk"+$exe.replace(".exe", ".lnk")
        $target = $bin + $exe
        Start-Process $target
        $objShortCut = $objShell.CreateShortcut($startup + $lnk)
        $objShortCut.TargetPath = $target
        $objShortCut.Save()
    }
}