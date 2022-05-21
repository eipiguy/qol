#NoEnv
SendMode Input
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Directories
Project_Directories(){
    static drop := Hotstring(":*:drop:", "D:\Dropbox\")
    static code := Hotstring(":*:code:", "D:\Dropbox\projects\code")
    static ahk := Hotstring(":*:ahk:", "D:\Dropbox\projects\code\ahk")
    static dnd := Hotstring(":*:dnd:", "D:\Dropbox\projects\dnd")
    static trains := Hotstring(":*:trains:", "C:\Users\ndnes\Dropbox\projects\trains")
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Terminal
^!t::
CmdOpen() {
    if WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
        WinHWND := WinActive()
        for win in ComObjCreate("Shell.Application").Windows
            if (win.HWND = WinHWND) {
                dir := SubStr(win.LocationURL, 9) ; remove "file:///"
                dir := RegExReplace(dir, "%20", " ")
                break
            }
    }
    Run, cmd, % dir ? dir : A_Desktop
}
return