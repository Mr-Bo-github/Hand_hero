; 定义变量以跟踪自动点击是否启用，默认为开启
autoClickEnabled := true

; 初始启动时显示提示通知
TrayTip, 手大侠【开启】, 左键连点【已开启】按前进可关闭（作者：XBZH）
Sleep 500
TrayTip

; 鼠标侧键 Button.x1 用于切换自动点击功能
XButton1::ToggleAutoClick()

; 切换自动点击功能的子程序
ToggleAutoClick() {
    global autoClickEnabled
    autoClickEnabled := !autoClickEnabled
    if (autoClickEnabled) {
        ; 播放系统插入设备的声音
        SoundPlay, %A_WinDir%\Media\Windows Hardware Insert.wav
        ToolTip, 手大侠【开启】
        SetTimer, RemoveToolTip, -500  ; -500毫秒后自动清除ToolTip
    } else {
        ; 播放系统插入设备的声音
        SoundPlay, %A_WinDir%\Media\Windows Hardware Remove.wav
        ToolTip, 手大侠【关闭】
        SetTimer, RemoveToolTip, -500  ; -500毫秒后自动清除ToolTip
    }
}

; 鼠标左键按下时触发自动点击
~LButton::
    SetMouseDelay, 0  ; 设定鼠标点击延迟为0
    ClickInterval := 10  ; 每次点击间隔为10毫秒
    
    ; 只在自动点击功能启用时点击
    while (GetKeyState("LButton", "P") && autoClickEnabled) {
        Click
        Sleep, ClickInterval
    }
return

; 清除提示工具
RemoveToolTip:
    ToolTip
return
