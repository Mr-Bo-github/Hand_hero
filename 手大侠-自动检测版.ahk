; ��������Ը����Զ�����Ƿ����ã�Ĭ��Ϊ����
autoClickEnabled := true

; ��ʼ����ʱ��ʾ��ʾ֪ͨ
TrayTip, �ִ�����������, ������㡾�ѿ�������ǰ���ɹرգ����ߣ�XBZH��
Sleep 500
TrayTip

; ����� Button.x1 �����л��Զ��������
XButton1::ToggleAutoClick()

; �л��Զ�������ܵ��ӳ���
ToggleAutoClick() {
    global autoClickEnabled
    autoClickEnabled := !autoClickEnabled
    if (autoClickEnabled) {
        ; ����ϵͳ�����豸������
        SoundPlay, %A_WinDir%\Media\Windows Hardware Insert.wav
        ToolTip, �ִ�����������
        SetTimer, RemoveToolTip, -500  ; -500������Զ����ToolTip
    } else {
        ; ����ϵͳ�����豸������
        SoundPlay, %A_WinDir%\Media\Windows Hardware Remove.wav
        ToolTip, �ִ������رա�
        SetTimer, RemoveToolTip, -500  ; -500������Զ����ToolTip
    }
}

; ����������ʱ�����Զ����
~LButton::
    SetMouseDelay, 0  ; �趨������ӳ�Ϊ0
    ClickInterval := 10  ; ÿ�ε�����Ϊ10����
    
    ; ֻ���Զ������������ʱ���
    while (GetKeyState("LButton", "P") && autoClickEnabled) {
        Click
        Sleep, ClickInterval
    }
return

; �����ʾ����
RemoveToolTip:
    ToolTip
return
