#NoTrayIcon
#SingleInstance force

^F2::
    toggle := !toggle
    if(toggle) {
        SoundPlay, C:\windows\song.mp3
    } else {
        SoundPlay, Nonexistent.avi
    }
return