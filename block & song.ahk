#NoTrayIcon
#SingleInstance force

hk(f=0, mouse=0, message:="`THIS COMPUTER IS LOCKED BY REMOTE ACCESS TOOL") { 
  static allkeys, ExcludeKeys:="LButton,RButton"
  if !allkeys
  {
     s:="||NumpadEnter|Home|End|PgUp|PgDn|Left|Right|Up|Down|Del|Ins|"
    Loop, 254
      k:=GetKeyName(Format("VK{:0X}",A_Index))
        , s.=InStr(s, "|" k "|") ? "" : k "|"
    For k,v in {Control:"Ctrl",Escape:"Esc"}
      s:=StrReplace(s, k, v)
    allkeys:=Trim(s, "|")
  }
  ;------------------
  f:=f ? "On":"Off"
  if mouse
  ExcludeKeys:=""
  For k,v in StrSplit(allkeys,"|")
    if v not in %ExcludeKeys%
      Hotkey, *%v%, Block_Input, %f% UseErrorLevel
  Block_Input:
  if message!=
  Progress, B1 M fs12 ZH0, %message%
  if (f="off")
  Progress, Off
  Return
}


F1 & F12::
hk(1,1)  ; Disable all keyboard or mouse buttons
return

F12 & F11::
hk(0)  ; Enable all keyboard and mouse buttons
Return

^F2::
    toggle := !toggle
    if(toggle) {
        SoundPlay, C:\windows\song.mp3
    } else {
        SoundPlay, Nonexistent.avi
    }
return