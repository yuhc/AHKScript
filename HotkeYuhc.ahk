;�ű���������
IfExist, HotkeYuhc.ico
{
	Menu TRAY, Icon, HotkeYuhc.ico
}

Menu, Tray, NoStandard
Menu, Tray, Add, ����, HelpSoft
Menu, Tray, Add, ����, AboutSoft
Menu, Tray, Add, �˳�, ExitSoft

#^!r::
RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Run\, AutoHotKey, %A_AhkPath%
Return

#^!a::
AboutSoft:
TickCount1 := Floor(A_TickCount / 60000)
TickCount2 := Floor(A_TickCount / 1000 - TickCount1 * 60)
MsgBox, 64, About, Hi %A_UserName%!`nToday is %A_YYYY%-%A_MM%-%A_DD%(%A_YDay%), %A_Hour%:%A_Min%, Elapsed Time: %TickCount1%min %TickCount2%s`n`nThe Script is created by Yuhc.`nRecent Version: Core Ver%A_AhkVersion%, Script Ver1.3.0912
Return

#^!h::
HelpSoft:
MsgBox, 4128, Help, Win+Ctrl+Alt+H ����`nWin+Ctrl+Alt+A ����`nWin+Q �˳�`nWin+N ���м��±�`nWin+T һ���Ӽ�ʱ��`nWin+Ctrl+T ��ʱ��`nWin+C ��ȡ�������λ����ɫ`nWin+P Get Mouse Position`nCtrl+Alt+Shift+E ��ʾ�������ļ���չ��`nCtrl+Alt+Shift+H ��ʾ������ϵͳ�ļ�`nWin+Ctrl+C �õ�ѡ���ļ���·��`nWin+Ctrl+Alt+W ����Wifi�ȵ㣨�ݹ̶����ƺ����룩`nWin+Ctrl+W ����Wifi�ȵ�`nWin+Ctrl+G �ر�Wifi�ȵ�
Return

#q::
ExitSoft:
	ExitApp
Return

;----------------------------------------------------------------------
;Reverse the Wheel
WheelUp::
Send {WheelDown}
Return

WheelDown::
Send {WheelUp}
Return

;Get Mouse Position (Win+P)
#p::
	MouseGetPos, MouseX, MouseY
	MsgBox X=%MouseX%, Y=%MouseY%
Return

;----------------------------------------------------------------------
;Get the Screen Color (Win+C)
#c::
	MouseGetPos, MouseX, MouseY
	PixelGetColor, color, %MouseX%, %MouseY%, RBG
	StringRight color, color, 6
	Clipboard = #%color%
	tooltip, #%Clipboard% has been sent to the Clipboard
	sleep 2000
	tooltip,
Return

;Get the Selected File's Path (Ctrl+Win+C)
^#c::
Send ^c
Sleep, 200
Clipboard=%Clipboard%
tooltip,%Clipboard%
Sleep, 500
Tooltip,
Return

;----------------------------------------------------------------------

;����������
#!e::Run D:\Program Files\Youdao\Dict\Application\YodaoDict.exe	;�е��ʵ�
#!q::Run D:\Program Files\Tencent\QQ\Bin\QQ.exe					;��ѶQQ
#!f::Run D:\Program Files\Foobar2000\foobar2000.exe				;Foobar2000
#!t::Run D:\Program Files\TTPlayer\TTPlayer.exe					;ǧǧ����
#!m::Run D:\Program Files\Maxthon3\Bin\Maxthon.exe					;����
#!u::Run D:\Program Files\uTorrent\uTorrent.exe					;uTorrent
#!b::Run D:\Program Files\Deny Sticker\sticker.exe					;��ǩ
#!a::Run F:\UsefulToys\QQCapture.exe								;��Ļ��ͼ
#!p::Run F:\UsefulToys\���ű�������.exe							;���ű�������

;----------------------------------------------------------------------

#n::Run notepad
#j::Run www.yuhc.me

;#z::
;Click Left
;;MouseClick, Left
;Return
;#x::
;Click Right
;;MouseClick, Right
;Return

;�Զ������
::/mail::yuhc123@126.com
::/yhc::
	Clipboard = Hangchen Yu
	Send ^v
Return

;��ȡ����ʱ��
::/dd::
	d = %A_YYYY%-%A_MM%-%A_DD%
	Clipboard = %d%
	Send ^v
Return

;��ʱ��
#t::
	MsgBox ��ʱ��ʼ
	Sleep, 60000
	MsgBox ��ʱ������1���ӣ�
Return

;��ǿ���ʱ��������ʱ��Ϊ��
#^t::
	InputBox, time, �����, ���뵹��ʱ����
	time := time * 1000
	Sleep, %time%
	MsgBox ��ʱ������%time%���룩
Return

;��ʾ / ���� �ļ���չ����
;��������ϵ� AppsKey �������Ҽ���ѡ��ˢ��(e)��
^!+e::
	If value = 0
		value = 1
	Else
		value = 0
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\, HideFileExt, %Value%
	Send { AppsKey } e
Return

;��ʾ / ���� ����ϵͳ�ļ���
^!+h::
	If value = 1
		value = 2
	Else
		value = 1
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\, Hidden, %Value%
	Send { AppsKey } e
Return

;Wifi�ȵ㴴��
^#w::
Run, %comspec% /c netsh wlan set hostednetwork mode=allow ssid=Yuhc key=309123456
Traytip, ����Wifi�ȵ�, SSID=Yuhc Key=309123456, 500
Return
^#k::
Run, %comspec% /c netsh wlan start hostednetwork
Traytip, ,����Wifi�ȵ�, 1000
Return
^#g::
Run, %comspec% /c netsh wlan stop hostednetwork
Traytip, ,�ر�Wifi�ȵ�, 1000
Return
