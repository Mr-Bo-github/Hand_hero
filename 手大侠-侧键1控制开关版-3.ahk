; 显示免责声明
TrayTip, 免责声明, 软件仅供学习，不得用于商业用途，请在下载后24小时内删除!, 5

; 定义变量以跟踪自动点击是否启用
autoClickEnabled := false

; 检查是否已经有 Sausage Man.exe 进程在运行
Process, Exist, Sausage Man.exe
if (ErrorLevel = 0) {
    ; 如果进程未找到，则检查 Loader.exe 是否存在
    IfNotExist, D:\Sausage Man\Game\Loader.exe
    {
        ; 文件未找到，弹窗提示
        MsgBox, 16, 错误, 找不到 D:\Sausage Man\Game\Loader.exe 文件
        ; 继续运行脚本，而不是退出
    }
    else
    {
        ; 启动 Loader.exe
        Run, D:\Sausage Man\Game\Loader.exe
    }
}

; 鼠标侧键 Button.x1 用于切换自动点击功能
XButton1::ToggleAutoClick()

; 切换自动点击功能的子程序
ToggleAutoClick() {
    global autoClickEnabled
    autoClickEnabled := !autoClickEnabled
    if (autoClickEnabled) {
        ; 播放系统插入设备的声音
        SoundPlay, %A_WinDir%\Media\Windows Hardware Insert.wav
        ToolTip, 手大侠【开启】`n侧键x1关闭-作者：SUS
        SetTimer, RemoveToolTip, -500  ; -500毫秒后自动清除ToolTip
    } else {
        ; 播放系统移出设备的声音
        SoundPlay, %A_WinDir%\Media\Windows Hardware Remove.wav
        ToolTip, 手大侠【关闭】`n侧键x1开启-作者：SUS
        SetTimer, RemoveToolTip, -500  ; -500毫秒后自动清除ToolTip
    }
}

; 清除ToolTip的子程序
RemoveToolTip:
ToolTip
return

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
