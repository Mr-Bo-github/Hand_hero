; ��ʾ��������
TrayTip, ��������, �������ѧϰ������������ҵ��;���������غ�24Сʱ��ɾ��!, 5

; ��������Ը����Զ�����Ƿ�����
autoClickEnabled := false

; ����Ƿ��Ѿ��� Sausage Man.exe ����������
Process, Exist, Sausage Man.exe
if (ErrorLevel = 0) {
    ; �������δ�ҵ������� Loader.exe �Ƿ����
    IfNotExist, D:\Sausage Man\Game\Loader.exe
    {
        ; �ļ�δ�ҵ���������ʾ
        MsgBox, 16, ����, �Ҳ��� D:\Sausage Man\Game\Loader.exe �ļ�
        ; �������нű����������˳�
    }
    else
    {
        ; ���� Loader.exe
        Run, D:\Sausage Man\Game\Loader.exe
    }
}

; ����� Button.x1 �����л��Զ��������
XButton1::ToggleAutoClick()

; �л��Զ�������ܵ��ӳ���
ToggleAutoClick() {
    global autoClickEnabled
    autoClickEnabled := !autoClickEnabled
    if (autoClickEnabled) {
        ; ����ϵͳ�����豸������
        SoundPlay, %A_WinDir%\Media\Windows Hardware Insert.wav
        ToolTip, �ִ�����������`n���x1�ر�-���ߣ�SUS
        SetTimer, RemoveToolTip, -500  ; -500������Զ����ToolTip
    } else {
        ; ����ϵͳ�Ƴ��豸������
        SoundPlay, %A_WinDir%\Media\Windows Hardware Remove.wav
        ToolTip, �ִ������رա�`n���x1����-���ߣ�SUS
        SetTimer, RemoveToolTip, -500  ; -500������Զ����ToolTip
    }
}

; ���ToolTip���ӳ���
RemoveToolTip:
ToolTip
return

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
