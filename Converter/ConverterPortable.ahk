﻿#NoEnv          ; для производительности и совместимости с будущими AutoHotkey-релизы.
#Persistent     ; Выполнять скрипт, пока не закроет пользователь.
#IfWinActive, ahk_class AutoHotkeyGUI ;работает только в активном GUI, при сворачивании ожидает активации окна.
#SingleInstance Force ; старый экземпляр скрипта будет замещён новым автоматически, без вывода диалогового окна.
#Include Functions.ahk

SendMode Input  ; для новых сценариев, обеспечение высокой скорости и надежности.
SetWorkingDir %A_ScriptDir%  ; Обеспечивает согласованность c начальныv каталогом.
FileCreateDir, %A_Temp%\DBFFC.tmp
IfNotExist %A_AppData%\Конвертер\Logs
	FileCreateDir, %A_AppData%\Конвертер\Logs

Gui, 33: Color, White
Gui, 33: Font, cRed S16 W700
Gui, 33: +AlwaysOnTop -border -Caption +Owner +ToolWindow
Gui, 33: Add, text, ,`tЗагрузка...`n `n Подождите несколько секунд.`n`n`n`t`t©Apik21
Gui, 33: Show, Center, app
WinSet, TransColor, White, app
gosub, Label1
WinWaitActive, Конвертер
WinActivate, Конвертер
ControlFocus,,Конвертер
Gui, 33: Submit
return

Label1:
;***********************************************************************************************
global Vers, global sborka, global dev_sborka
global DnDJpeg, global DnDPdf, global DnDTiff, global DnDDoc, global DnDPng
global PageN, global LogLine, global CmdLog
global gs, global cv, global sys
global Win, global Dos, global Iso, global Koir, global Koiu, global Mac, Period
;***************Проверка разрядности системы************************************************************
Architectura()
if (sys = "win64"){
	gs := "gswin64c.exe"
	cv := "cvert64.exe"
}else if (sys = "win32"){
	gs := "gswin32c.exe"
	cv := "cvert.exe"
}
;***********************************************************************************************
;***************Переменные настройки************************************************************
;***********************************************************************************************
sborka = 347                                  ; Номер сборки версии
dev_sborka = https://raw.githubusercontent.com/Apik21/Converter/master/sborka.txt ;Сборка с сайта
Vers = v1.1.2								  ; Номер версисии комбайна
PageN = 1251                                  ; Номер кодовой страницы
Repo = https://raw.githubusercontent.com/Apik21/Converter/master/ConverterPortable.exe ; Адрес программы для обновления
Rep = https://github.com/Apik21/Converter/tree/master
LogPath = %A_AppData%\Конвертер\Logs\         ; Путь к папле для создания логов
LogLine = "=========================================== `%date`% - `%time`% ================================================"
CmdLog = echo %LogLine% >>"%LogPath%`%date`%.log" 2>>&1 && chcp %PageN% >>"%LogPath%`%date`%.log" 2>>&1
;***********************************************************************************************
;***********************************************************************************************
;***********************************************************************************************


IfNotExist, %LogPath%\Config.ini
{
	IniWrite, 1251, %LogPath%\Config.ini, Options, PageN
	IniWrite, 14, %LogPath%\Config.ini, Options, Period
	IniWrite, %A_YDay%, %LogPath%\Config.ini, Options, DataIzm
	global PageN = 1251, global Period = 14
   	CmdLog = echo %LogLine% >>"%LogPath%`%date`%.log" 2>>&1 && chcp %PageN% >>"%LogPath%`%date`%.log" 2>>&1
	RunWait, %comspec% /c %CmdLog%,, Hide UseErrorLevel
	GuiControl,27:,Period, %Period%
	IniWrite, %A_Temp%\DBFFC.tmp\she\Skins1.she, %LogPath%\Config.ini, Skin, SkinPath
}
else
{
	IniRead, PageN, %LogPath%\Config.ini, Options, PageN, 1251
	CmdLog = echo %LogLine% >>"%LogPath%`%date`%.log" 2>>&1 && chcp %PageN% >>"%LogPath%`%date`%.log" 2>>&1
	RunWait, %comspec% /c %CmdLog%,, Hide UseErrorLevel
	IniRead, Period, %LogPath%\Config.ini, Options, Period, 14
	GuiControl,27:, Period, %Period%
}

;================================/INCLUDE===========================================================
FileCreateDir, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d
FileCreateDir, %A_Temp%\DBFFC.tmp\p2d\fonts
FileCreateDir, %A_Temp%\DBFFC.tmp\p2d\locale\de\LC_MESSAGES
FileCreateDir, %A_Temp%\DBFFC.tmp\p2d\locale\lp\LC_MESSAGES
FileCreateDir, %A_Temp%\DBFFC.tmp\p2d\locale\pt\LC_MESSAGES
FileCreateDir, %A_Temp%\DBFFC.tmp\p2d\locale\ru-blocked\LC_MESSAGES
FileCreateDir, %A_Temp%\DBFFC.tmp\p2d\locale\uk\LC_MESSAGES
FileCreateDir, %A_Temp%\DBFFC.tmp\she

FileInstall, she\Skins1.she, %A_Temp%\DBFFC.tmp\she\Skins1.she
FileInstall, she\Skins2.she, %A_Temp%\DBFFC.tmp\she\Skins2.she
FileInstall, she\Skins3.she, %A_Temp%\DBFFC.tmp\she\Skins3.she
FileInstall, she\Skins4.she, %A_Temp%\DBFFC.tmp\she\Skins4.she
FileInstall, she\Skins5.she, %A_Temp%\DBFFC.tmp\she\Skins5.she
FileInstall, she\Skins6.she, %A_Temp%\DBFFC.tmp\she\Skins6.she
FileInstall, she\Skins7.she, %A_Temp%\DBFFC.tmp\she\Skins7.she
FileInstall, she\Skins8.she, %A_Temp%\DBFFC.tmp\she\Skins8.she
FileInstall, she\Skins9.she, %A_Temp%\DBFFC.tmp\she\Skins9.she
FileInstall, she\Skins10.she, %A_Temp%\DBFFC.tmp\she\Skins10.she
FileInstall, she\Skins11.she, %A_Temp%\DBFFC.tmp\she\Skins11.she
FileInstall, she\Skins12.she, %A_Temp%\DBFFC.tmp\she\Skins12.she
FileInstall, she\Skins13.she, %A_Temp%\DBFFC.tmp\she\Skins13.she
FileInstall, she\Skins14.she, %A_Temp%\DBFFC.tmp\she\Skins14.she
FileInstall, SkinH_EL.dll, %A_Temp%\DBFFC.tmp\SkinH_EL.dll

FileInstall, Sourse\tb2bt.exe, %A_Temp%\DBFFC.tmp\tb2bt.exe
FileInstall, Sourse\bsed.exe, %A_Temp%\DBFFC.tmp\bsed.exe
FileInstall, Sourse\cvert.exe, %A_Temp%\DBFFC.tmp\cvert.exe
FileInstall, Sourse\cvert64.exe, %A_Temp%\DBFFC.tmp\cvert64.exe
FileInstall, Sourse\gswin64c.exe, %A_Temp%\DBFFC.tmp\gswin64c.exe
FileInstall, Sourse\gsdll64.dll, %A_Temp%\DBFFC.tmp\gsdll64.dll
FileInstall, Sourse\gsdll64.lib, %A_Temp%\DBFFC.tmp\gsdll64.lib
FileInstall, Sourse\gswin32c.exe, %A_Temp%\DBFFC.tmp\gswin32c.exe
FileInstall, Sourse\gsdll32.dll, %A_Temp%\DBFFC.tmp\gsdll32.dll
FileInstall, Sourse\gsdll32.lib, %A_Temp%\DBFFC.tmp\gsdll32.lib
FileInstall, Sourse\libiconv2.dll, %A_Temp%\DBFFC.tmp\libiconv2.dll
FileInstall, Sourse\pdftk.exe, %A_Temp%\DBFFC.tmp\pdftk.exe
FileInstall, Sourse\doc2fb.xsl, %A_Temp%\DBFFC.tmp\doc2fb.xsl
FileInstall, Sourse\doc.bat, %A_Temp%\DBFFC.tmp\doc.bat
FileInstall, help\1.chm, %A_Temp%\DBFFC.tmp\1.chm
FileInstall, P2D\bzz.exe, %A_Temp%\DBFFC.tmp\p2d\bzz.exe
FileInstall, P2D\c44.exe, %A_Temp%\DBFFC.tmp\p2d\c44.exe
FileInstall, P2D\cjb2.exe, %A_Temp%\DBFFC.tmp\p2d\cjb2.exe
FileInstall, P2D\csepdjvu.exe, %A_Temp%\DBFFC.tmp\p2d\csepdjvu.exe
FileInstall, P2D\djvmcvt.exe, %A_Temp%\DBFFC.tmp\p2d\djvmcvt.exe
FileInstall, P2D\djvuextract.exe, %A_Temp%\DBFFC.tmp\p2d\djvuextract.exe
FileInstall, P2D\djvumake.exe, %A_Temp%\DBFFC.tmp\p2d\djvumake.exe
FileInstall, P2D\djvused.exe, %A_Temp%\DBFFC.tmp\p2d\djvused.exe
FileInstall, P2D\libdjvulibre-21.dll, %A_Temp%\DBFFC.tmp\p2d\libdjvulibre-21.dll
FileInstall, P2D\libexiv2-14.dll, %A_Temp%\DBFFC.tmp\p2d\libexiv2-14.dll
FileInstall, P2D\libexpat-1.dll, %A_Temp%\DBFFC.tmp\p2d\libexpat-1.dll
FileInstall, P2D\libfontconfig-1.dll, %A_Temp%\DBFFC.tmp\p2d\libfontconfig-1.dll
FileInstall, P2D\libfreetype-6.dll, %A_Temp%\DBFFC.tmp\p2d\libfreetype-6.dll
FileInstall, P2D\libgcc_s_sjlj-1.dll, %A_Temp%\DBFFC.tmp\p2d\libgcc_s_sjlj-1.dll
FileInstall, P2D\libGraphicsMagick-3.dll, %A_Temp%\DBFFC.tmp\p2d\libGraphicsMagick-3.dll
FileInstall, P2D\libGraphicsMagick++-11.dll, %A_Temp%\DBFFC.tmp\p2d\libGraphicsMagick++-11.dll
FileInstall, P2D\libiconv.dll, %A_Temp%\DBFFC.tmp\p2d\libiconv.dll
FileInstall, P2D\libintl-8.dll, %A_Temp%\DBFFC.tmp\p2d\libintl-8.dll
FileInstall, P2D\libjpeg-62.dll, %A_Temp%\DBFFC.tmp\p2d\libjpeg-62.dll
FileInstall, P2D\libpoppler-19.dll, %A_Temp%\DBFFC.tmp\p2d\libpoppler-19.dll
FileInstall, P2D\libstdc++-6.dll, %A_Temp%\DBFFC.tmp\p2d\libstdc++-6.dll
FileInstall, P2D\pdf2djvu.exe, %A_Temp%\DBFFC.tmp\p2d\pdf2djvu.exe
FileInstall, p2d\etc\fonts\fonts.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\fonts.conf
FileInstall, p2d\etc\fonts\conf.d\30-metric-aliases.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\30-metric-aliases.conf
FileInstall, p2d\etc\fonts\conf.d\30-urw-aliases.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fontsconf.d\30-urw-aliases.conf
FileInstall, p2d\etc\fonts\conf.d\40-nonlatin.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\40-nonlatin.conf
FileInstall, p2d\etc\fonts\conf.d\45-latin.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\45-latin.conf
FileInstall, p2d\etc\fonts\conf.d\49-sansserif.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\49-sansserif.conf
FileInstall, p2d\etc\fonts\conf.d\50-user.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\50-user.conf
FileInstall, p2d\etc\fonts\conf.d\51-local.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\51-local.conf
FileInstall, p2d\etc\fonts\conf.d\60-latin.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\60-latin.conf
FileInstall, p2d\etc\fonts\conf.d\65-fonts-persian.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\65-fonts-persian.conf
FileInstall, p2d\etc\fonts\conf.d\65-nonlatin.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\65-nonlatin.conf
FileInstall, p2d\etc\fonts\conf.d\69-unifont.conf, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\69-unifont.conf
FileInstall, p2d\fonts\a010013l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\a010013l.pfb
FileInstall, p2d\fonts\a010015l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\a010015l.pfb
FileInstall, p2d\fonts\a010033l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\a010033l.pfb
FileInstall, p2d\fonts\a010035l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\a010035l.pfb
FileInstall, p2d\fonts\b018012l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\b018012l.pfb
FileInstall, p2d\fonts\b018015l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\b018015l.pfb
FileInstall, p2d\fonts\b018032l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\b018032l.pfb
FileInstall, p2d\fonts\b018035l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\b018035l.pfb
FileInstall, p2d\fonts\c059013l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\c059013l.pfb
FileInstall, p2d\fonts\c059016l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\c059016l.pfb
FileInstall, p2d\fonts\c059033l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\c059033l.pfb
FileInstall, p2d\fonts\c059036l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\c059036l.pfb
FileInstall, p2d\fonts\d050000l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\d050000l.pfb
FileInstall, p2d\fonts\n019003l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n019003l.pfb
FileInstall, p2d\fonts\n019004l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n019004l.pfb
FileInstall, p2d\fonts\n019023l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n019023l.pfb
FileInstall, p2d\fonts\n019024l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n019024l.pfb
FileInstall, p2d\fonts\n019043l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n019043l.pfb
FileInstall, p2d\fonts\n019044l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n019044l.pfb
FileInstall, p2d\fonts\n019063l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n019063l.pfb
FileInstall, p2d\fonts\n019064l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n019064l.pfb
FileInstall, p2d\fonts\n021003l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n021003l.pfb
FileInstall, p2d\fonts\n021004l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n021004l.pfb
FileInstall, p2d\fonts\n021023l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n021023l.pfb
FileInstall, p2d\fonts\n021024l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n021024l.pfb
FileInstall, p2d\fonts\n022003l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n022003l.pfb
FileInstall, p2d\fonts\n022004l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n022004l.pfb
FileInstall, p2d\fonts\n022023l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n022023l.pfb
FileInstall, p2d\fonts\n022024l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\n022024l.pfb
FileInstall, p2d\fonts\p052003l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\p052003l.pfb
FileInstall, p2d\fonts\p052004l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\p052004l.pfb
FileInstall, p2d\fonts\p052023l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\p052023l.pfb
FileInstall, p2d\fonts\p052024l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\p052024l.pfb
FileInstall, p2d\fonts\s050000l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\s050000l.pfb
FileInstall, p2d\fonts\z003034l.pfb, %A_Temp%\DBFFC.tmp\p2d\fonts\z003034l.pfb
FileInstall, p2d\locale\de\LC_MESSAGES\pdf2djvu.mo, %A_Temp%\DBFFC.tmp\p2d\locale\de\LC_MESSAGES\pdf2djvu.mo
FileInstall, p2d\locale\pl\LC_MESSAGES\pdf2djvu.mo, %A_Temp%\DBFFC.tmp\p2d\locale\pl\LC_MESSAGES\pdf2djvu.mo
FileInstall, p2d\locale\pt\LC_MESSAGES\pdf2djvu.mo, %A_Temp%\DBFFC.tmp\p2d\locale\pt\LC_MESSAGES\pdf2djvu.mo
FileInstall, p2d\locale\ru-blocked\LC_MESSAGES\pdf2djvu.mo, %A_Temp%\DBFFC.tmp\p2d\locale\ru-blocked\LC_MESSAGES\pdf2djvu.mo
FileInstall, p2d\locale\uk\LC_MESSAGES\pdf2djvu.mo, %A_Temp%\DBFFC.tmp\p2d\locale\uk\LC_MESSAGES\pdf2djvu.mo

FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\tb2bt.exe,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\bsed.exe,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\cvert.exe,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\gswin64c.exe,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\gsdll64.dll,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\gsdll64.lib,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\cvert64.exe,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\gswin32c.exe,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\gsdll32.dll,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\gsdll32.lib,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\libiconv2.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\pdftk.exe ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\doc.bat ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\doc2fb.xsl ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\1.chm ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\bzz.exe ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\c44.exe ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\cjb2.exe ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\csepdjvu.exe ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\djvmcvt.exe ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\djvuextract.exe ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\djvumake.exe ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\djvused.exe ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libdjvulibre-21.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libexiv2-14.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libexpat-1.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libfontconfig-1.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libfreetype-6.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libgcc_s_sjlj-1.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libGraphicsMagick-3.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libGraphicsMagick++-11.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libiconv.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libintl-8.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libjpeg-62.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libpoppler-19.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\libstdc++-6.dll ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\pdf2djvu.exe ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\fonts.conf
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\30-metric-aliases.conf ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\30-urw-aliases.conf ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\40-nonlatin.conf ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\45-latin.conf ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\49-sansserif.conf ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\50-user.conf ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\51-local.conf ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\60-latin.conf ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\65-fonts-persian.conf ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\65-nonlatin.conf ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\etc\fonts\conf.d\69-unifont.conf ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\a010013l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\a010015l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\a010033l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\a010035l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\b018012l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\b018015l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\b018032l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\b018035l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\c059013l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\c059016l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\c059033l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\c059036l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\d050000l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n019003l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n019004l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n019023l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n019024l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n019043l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n019044l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n019063l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n019064l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n021003l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n021004l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n021023l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n021024l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n022003l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n022004l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n022023l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\n022024l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\p052003l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\p052004l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\p052023l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\p052024l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\s050000l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\fonts\z003034l.pfb ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\locale\de\LC_MESSAGES\pdf2djvu.mo ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\locale\pl\LC_MESSAGES\pdf2djvu.mo ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\locale\pt\LC_MESSAGES\pdf2djvu.mo ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\locale\ru-blocked\LC_MESSAGES\pdf2djvu.mo ,0,0
FileSetAttrib, +HT, %A_Temp%\DBFFC.tmp\p2d\locale\uk\LC_MESSAGES\pdf2djvu.mo ,0,0

;***********************************************************************************************

pr:= A_Temp . "\DBFFC.tmp\SkinH_EL.dll"
IniRead, aa1, %LogPath%Config.ini , Skin , SkinPath
aa1:= aa1
SkinForm(Apply,pr,aa1)
OnExit, GetOut
try {
	Skins = =NO_SKIN=|
	Loop, %A_Temp%\DBFFC.tmp\she\*.she
		Skins .= A_LoopFileName "|"
} catch e {
	MsgBox % e "ERROR Code 1018 Skins_Read"
}

;***********************************************************************************************

;================================INCLUDE\===========================================================


;================================GUI/===============================================================
Gui, +hwndhGui1 + OwnDialogs +lastfound +e0x80 +Toolwindow
loop, 32
{
	If A_Index = 1
	{
		Gui, Color, Gray
		Gui, font, cFFFFFF
	}
	else
	{
		Gui, %A_Index%:Color, Gray
		Gui, %A_Index%:font, cFFFFFF
	}
}
Menu, Option, Add, &Открыть логи, LogOpen
Menu, Option, Add, &Настройки, Options
Menu, Option, Add, О&бновление, Update
Menu, HelpMenu, Add, &Справка, HelpAbout
Menu, HelpMenu, Add, &ChangeLog, Changelog
Menu, MyMenuBar, Add, Параметры, :Option
Menu, MyMenuBar, Add, Справка (F1), :HelpMenu ; Создаем строку меню, присоединяя к ней подменю:

Menu, Tray, NoStandard
Menu, Tray, MainWindow
Menu, pConvert, add, Jpg->Pdf, JP
Menu, pConvert, add, Pdf->Jpg, PJ
Menu, pConvert, add, Jpg->Tiff, JT
Menu, pConvert, add, Tiff->Jpg, TJ
Menu, pZip, add, JPG, ZJ
Menu, pZip, add, PDF, ZP
Menu, pZip, add, TIFF, ZT
Menu, Tray, add, Конвертация, :pConvert
Menu, Tray, add, Сжатие, :pZip
Menu, Tray, add
Menu, Tray, add, Закрыть, GuiClose
Menu, Tray, Tip, Ковертер изображений
Gui, Menu, MyMenuBar ; Присоединяем строку меню к окну:

Gui, Add, GroupBox, x5 y0 w120 h125 cRed, Конвертирование из
Gui, Add, GroupBox, x210 y0 w80 h120 cRed, Сжатие
Gui, Add, Button, x12 y20 w50 h30 , JPG
Gui, Add, Button, x12 y52 w50 h30 , PDF
Gui, Add, Button, x65 y20 w50 h30 , TIFF
Gui, Add, Button, x65 y52 w50 h30 gDOC, DOC
Gui, Add, Button, x12 y84 w50 h30 , PNG
Gui, Add, Progress, x5 y135 w200 h20 Smooth vProgr
Gui, Add, Button, x230 y130 w60 h30 gGuiClose, Выход
Gui, Add, Button, x225 y20 w50 h30 gZJ, J P G
Gui, Add, Button, x225 y50 w50 h30 gZP, P D F
Gui, Add, Button, x225 y80 w50 h30 gZT, T I F F
Gui, Add, Button, x130 y27 w75 h30 gDt, Дата
Gui, Add, Button, x130 y60 w75 h30 gBas, Шифрование
Gui, Add, StatusBar,,
SB_SetParts(150, 110)
SB_SetText("Версия " . Vers . "." . sborka, 2)
SB_SetText(	A_Hour . ":" . A_Min, 3)
SetTimer, BarTime, 3000
SB_SetIcon("shell32.dll", 266)
Gui, Default

Loop
{
	if A_Index in 2,4,6,7,8,23,24
	{
		Gui, %A_Index%:+hwndhGui%A_Index% +owner1 -Caption +Border
		Gui, %A_Index%:Add, Edit, x5 y5 w60 h25 vZip , 85
		Gui, %A_Index%:Add, Text, x70 y5 w150 h30 r2 , Качество `n 99-max 1-min
		Gui, %A_Index%:Add, CheckBox, x5 y40 w150 h25 vDel, УДАЛИТЬ исходные файлы
		Gui, %A_Index%:Add, Button, x5 y70 w100 h30 , OK
		Gui, %A_Index%:Add, Button, x115 y70 w100 h30 , Отмена
	}
	else if A_Index > 24
		break
}

Gui, 3:+hwndhGui3 +owner1 -Caption +Border
Gui, 3:Add, CheckBox, x5 y5 w200 h25 vDel, УДАЛИТЬ исходные файлы
Gui, 3:Add, Button, x5 y40 w100 h30 , OK
Gui, 3:Add, Button, x115 y40 w100 h30 , Отмена


Loop
{
	if A_Index in 15,16,17,18,19,20
	{
		Gui, %A_Index%:+hwndhGui%A_Index% +owner1 -Caption +Border
		Gui, %A_Index%:Add, Edit, x5 y5 w50 h20 vZip , 85
		Gui, %A_Index%:Add, Edit, x5 y35 w50 h20 vPage, 0
		Gui, %A_Index%:Add, Text, x70 y5 w210 h20 r2, Степень сжатия (качество) `n 99-max 1-min
		Gui, %A_Index%:Add, Text, x70 y35 w180 h25 , Номер конвертируемой страницы `n 0-все страницы
		Gui, %A_Index%:Add, CheckBox, x5 y60 w200 h20 vDel, УДАЛИТЬ исходные файлы
		Gui, %A_Index%:Add, Button, x5 y85 w100 h30 , OK
		Gui, %A_Index%:Add, Button, x115 y85 w100 h30 , Отмена
	}
	else if A_Index > 20
		break
}

Gui, 9:+hwndhGui9 +owner1 -Caption +Border
Gui, 9:Add, Button, x2 y5 w80 h30 , Сжать
Gui, 9:Add, Button, x2 y40 w80 h30 gVost, Восстановить
Gui, 9:Add, Button, x84 y5 w80 h30 , Разрезать
Gui, 9:Add, Button, x84 y40 w80 h30 , Склеить
Gui, 9:Add, Button, x166 y5 w75 h30 gMD, Изм. Мета.
Gui, 9:Add, Button, x166 y40 w75 h30 gDSh, Защита

Loop
{
	if A_Index in 10,32
	{
		Gui, %A_Index%:+hwndhGui%A_Index% +owner1 -Caption +Border
		Gui, %A_Index%:Add, Edit, x5 y10 w290 h25 vStran
		Gui, %A_Index%:Add, Text, x5 y40 w290 h40 HWNDHwndGui32, Укажите сохраняемые страницы:1, 3-5, 8 Для поворота после страницы указать сторну поворота: left, right, down. См. справку.
		Gui, %A_Index%:Add, Button, x5 y85 w140 h30 gSplt%A_Index%, Сохранить выбранные страницы
		Gui, %A_Index%:Add, Button, x160 y85 w60 h30 , Отмена
	}
	else if A_Index > 32
		break
}

Gui, 11:+hwndhGui11 +owner1 -Caption +Border
Gui, 11:Add, Text, x10    y5 w290 h20 , В какой формат будем конвертировать документ?
Gui, 11:Add, Button, x5   y30 w60 h30 gCHtml, HTML
Gui, 11:Add, Button, x70  y30 w60 h30 gCRtf, RTF
Gui, 11:Add, Button, x135 y30 w60 h30 gCMht, MHT
Gui, 11:Add, Button, x200 y30 w60 h30 gCTxt, TXT
Gui, 11:Add, Button, x200 y65 w60 h30 gCXml, XML
Gui, 11:Add, Button, x135 y65 w60 h30 gCPdf, PDF
Gui, 11:Add, Button, x70  y65 w60 h30 gCXps, XPS
Gui, 11:Add, Button, x5   y65 w60 h30 gCFb2, FB2

Gui, 12: +hwndhGui12 +owner1 -Caption +Border
Gui, 12:Add, Text, x12 y0 w230 h30 , В какой формат будем конвертировать?
Gui, 12:Add, Button, x5 y15 w50 h30 gJP, PDF
Gui, 12:Add, Button, x60 y15 w50 h30 gJT, TIFF
Gui, 12:Add, Button, x115 y15 w50 h30 gJPs, PS
Gui, 12:Add, Button, x170 y15 w50 h30 gJPn, PNG
Gui, 12:Add, Button, x5 y50 w50 h30 gJJ, JPEG
Gui, 12:Add, Button, x60 y50 w50 h30 gJI, ICO
Gui, 12:Add, Button, x115 y50 w50 h30 gJE, EMF
Gui, 12:Add, Button, x170 y50 w50 h30 gJB, BMP

Gui, 13:+hwndhGui13 +owner1 -Caption +Border
Gui, 13:Add, Text, x12 y0 w230 h30 , В какой формат будем конвертировать?
Gui, 13:Add, Button, x5 y15 w50 h30 gPJ, JPEG
Gui, 13:Add, Button, x60 y15 w50 h30 gPTc, TIFF(цв)
Gui, 13:Add, Button, x115 y15 w50 h30 gPTb, TIFF(ч/б)
Gui, 13:Add, Button, x170 y15 w50 h30 gPTx, TXT
Gui, 13:Add, Button, x225 y15 w50 h30 gPD, DJVU

Gui, 14:+hwndhGui14 +owner1 -Caption +Border
Gui, 14:Add, Text, x12 y0 w230 h30 , В какой формат будем конвертировать?
Gui, 14:Add, Button, x5 y15 w50 h30 gTJ, JPEG
Gui, 14:Add, Button, x60 y15 w50 h30 gTPs, PS
Gui, 14:Add, Button, x115 y15 w50 h30 gTPn, PNG
Gui, 14:Add, Button, x5 y50 w50 h30 gTP, PDF
Gui, 14:Add, Button, x60 y50 w50 h30 gTI, ICO
Gui, 14:Add, Button, x115 y50 w50 h30 gTE, EMF
Gui, 14:Add, Button, x170 y50 w50 h30 gTB, BMP

Gui, My:+hwndhGuiMy +Resize +HwndMyGuiHwnd  ; Задаем окну свойство изменять размер.
Gui, My:Add, Button, x5 y5, Сохранить
Gui, My:Add, Button, x80 y5, Выход
Gui, My:Add, Edit, x5 y40 W400 R30 vMeta,

Gui, 21:+hwndhGui21 +owner1 -Caption +Border
Gui, 21:Add, Text, x2 y0 w300 h40 , Изменение даты и времени создания/изменения/доступа к файлу.`nЧто будем менять?
Gui, 21:Add, Text, x2 y45 w300 h20 , Введите значение нового времени по образцу:
Gui, 21:Add, Edit, x2 y70 w150 h20 vVremya , %A_Now%
Gui, 21:Add, Button, x1 y95 w80 h40 gVI, Время изменения
Gui, 21:Add, Button, x82 y95 w80 h40 gVS, Время создания
Gui, 21:Add, Button, x163 y95 w80 h40 gVD, Время последнего доступа

Gui, 22: +hwndhGui22 +owner1 -Caption +Border
Gui, 22:Add, Text, x12 y0 w230 h30 , В какой формат будем конвертировать?
Gui, 22:Add, Button, x5 y15 w50 h30 gPP, PDF
Gui, 22:Add, Button, x60 y15 w50 h30 gPT, TIFF
Gui, 22:Add, Button, x115 y15 w50 h30 gPPs, PS
Gui, 22:Add, Button, x170 y15 w50 h30 gPnJ, JPG
Gui, 22:Add, Button, x5 y50 w50 h30 gPJe, JPEG
Gui, 22:Add, Button, x60 y50 w50 h30 gPI, ICO
Gui, 22:Add, Button, x115 y50 w50 h30 gPE, EMF
Gui, 22:Add, Button, x170 y50 w50 h30 gPB, BMP

Int = 1
Gui, 25:+hwndhGui25 +owner1 -Caption +Border
Gui, 25:Add, Text, x2 y0 w300 h20 , Шифрование и дешифровка файлов по алгоритму Base64
Gui, 25:Add, Edit, x5 y25 w20 h20 vInt, %Int%
Gui, 25:Add, Text, x30 y25 w270 h20  , Количество циклов де-/шифрования (см. Справку).
Gui, 25:Add, Button, x5 y50 w70 h40 gBasE, Шифровать
Gui, 25:Add, Button, x80 y50 w80 h40 gBasD, Дешифровать
Gui, 25:Add, Button, x165 y50 w80 h40 gTb2bt, Шиф./Дешиф. текст

Gui, 26:+hwndhGui26 +owner1 -Caption +Border
Gui, 26:Add, Button, x5 y5 w100 h30 gDnd_Zip, Пакетное сжатие
Gui, 26:Add, Button, xp+105 yp w100 h30 gDnd_Merge, Склеить выбранное
Gui, 26:Add, Button, xp+105 yp w80 h30 gDnd_Cancel, Отмена

Gui, 27:Add, GroupBox, x3 y10 w150 h180 , Кодовая страница
Gui, 27:Add, ListBox, vPageCode x15 y46 Choose1 R6 h150 AltSubmit, 1251     - Windows|866       - Dos|28595   - ISO|20866   - KOI8-R|21866   - KOI8-U|10007   - Mac
Gui, 27:Add, GroupBox, x162 y10 w252 h115 , Обновление
Gui, 27:Add, Text, x170 y35 w150 h20 , Проверка обновлений
Gui, 27:Add, Edit, x170 y56 w227 h20 vRep, %Rep%
Gui, 27:Add, Text, x170 y80 w200 h20 , Частота автопроверки обновлений
Gui, 27:Add, Edit, x170 y101 w30 h20 vPeriod, %Period%
Gui, 27:Add, Text, x210 y101 w50 h20 , дней
Gui, 27:Add, GroupBox, x162 y130 w252 h60 , Оформление
Gui, 27:Add, Text, x167 yp+25 w40  , Скин
Gui, 27:Add, DropDownList, xp+45 yp w190 vSkinName Sort, %Skins%
Gui, 27:Add, Button, x100 y210 w100 h30 , Сохранить
Gui, 27:Add, Button, xp+150 yp w100 h30 , Отмена

Gui, 28:+hwndhGui28 +owner1 -Caption +Border
Gui, 28:Add, Text, x12 y0 w230 h30 , В какой формат будем конвертировать?
Gui, 28:Add, Button, x5 y15 w50 h30 gDJ, JPEG
Gui, 28:Add, Button, x60 y15 w50 h30 gDPs, PS
Gui, 28:Add, Button, x115 y15 w50 h30 gDTi, TIFF
Gui, 28:Add, Button, x5 y50 w50 h30 gDP, PDF
Gui, 28:Add, Button, x170 y15 w50 h30 gDB, BMP

loop
{
	if A_Index in 29,30,31
	{
		N := A_Index-28
		Gui, %A_Index%:+hwndhGui%A_Index% +owner1 -Caption +Border
		Gui, %A_Index%:Add, Edit, x5 y10 w50 h25 vPg
		Gui, %A_Index%:Add, Text, x60 y10 w230 h30, Укажите номер сохраняемой страницы.
		Gui, %A_Index%:Add, Button, x5 y45 w140 h30 gSave%N%, Сохранить выбранные страницы
		Gui, %A_Index%:Add, Button, x160 y45 w60 h30 , Отмена
	}
	else if A_Index > 31
		break
}

VarSetCapacity(WI, 64)
Sleep, 1000

global Arr := [{Perem: "Win",  Page: 1251,  Chek: "- 1251 Win"}
			       , {Perem: "Dos",  Page: 866,   Chek: "- 866 Dos"}
			       , {Perem: "Iso",  Page: 28595, Chek: "- 28595 ISO"}
			       , {Perem: "Koir", Page: 20866, Chek: "- 20866 KOI8-R"}
			       , {Perem: "Koiu", Page: 21866, Chek: "- 21866 KOI8-U"}
			       , {Perem: "Mac",  Page: 10007, Chek: "- 10007 Mac"}]

		 global GuHi := [{GuiN: 1,  Hg: 190}
						 			 , {GuiN: 2,  Hg: 105}
						 			 , {GuiN: 3,  Hg: 70}
						 			 , {GuiN: 4,  Hg: 105}
						 			 , {GuiN: 5,  Hg: 115}
						 			 , {GuiN: 6,  Hg: 105}
						 			 , {GuiN: 7,  Hg: 105}
						 			 , {GuiN: 8,  Hg: 105}
						 			 , {GuiN: 9,  Hg: 80}
						 			 , {GuiN: 10, Hg: 120}
						 			 , {GuiN: 11, Hg: 100}
						 			 , {GuiN: 12, Hg: 85}
						 			 , {GuiN: 13, Hg: 90}
						 			 , {GuiN: 14, Hg: 85}
						 			 , {GuiN: 15, Hg: 115}
						 			 , {GuiN: 16, Hg: 115}
						 			 , {GuiN: 17, Hg: 115}
						 			 , {GuiN: 18, Hg: 115}
						 			 , {GuiN: 19, Hg: 115}
						 			 , {GuiN: 20, Hg: 115}
						 			 , {GuiN: 21, Hg: 140}
						 			 , {GuiN: 22, Hg: 85}
						 			 , {GuiN: 23, Hg: 105}
						 			 , {GuiN: 24, Hg: 105}
						 			 , {GuiN: 25, Hg: 100}
						 			 , {GuiN: 26, Hg: 40}
						 			 , {GuiN: 27, Hg: 40}
						 			 , {GuiN: 28, Hg: 85}
						 			 , {GuiN: 29, Hg: 80}
						 			 , {GuiN: 30, Hg: 80}
						 			 , {GuiN: 31, Hg: 80}
						 			 , {GuiN: 32, Hg: 120}]

Gui, Show, Center h190 w300, Конвертер
;================АВТООБНОВЛЕНИЕ=====================================
try {
IfExist, %LogPath%\Config.ini
{
	IniRead, DataIzm, %LogPath%\Config.ini, Options, DataIzm
	Delta = %A_YDay% - %DataIzm%

	If Delta >= %Period%
	{
		IfExist, %A_Temp%\DBFFC.tmp\sborka.txt
		FileDelete, %A_Temp%\DBFFC.tmp\sborka.txt
		If ConnectedToInternet()
		{
			UrlDownloadToFile, %dev_sborka%, %A_Temp%\DBFFC.tmp\sborka.txt
			ELM(%ErrorLevel%, Ошибка загрузки, 1)
			FileRead, new_sborka, %A_Temp%\DBFFC.tmp\sborka.txt
			ELM(%ErrorLevel%, Ошибка чтения, 1)
			If new_sborka > %sborka%
			{
				MsgBox, 52, Обновление, Найдена новая версия программы.`n Текущая версия программы - %Vers%.%sborka%,`n Новая версия программы - %Vers%.%new_sborka%.`n Скачать обновление???
				FileDelete, %A_Temp%\DBFFC.tmp\sborka.txt
				IfMsgBox Yes
				{
					MsgBox,,Конвертер,Спасибо за ваш выбор.
					Run, %Repo%
					bat = ping 127.0.0.1 > NUL`ndel /F /Q ConverterPortable*.exe`ndel /F /Q delete.bat
					FileDelete, delete.bat
					FileAppend %bat%, delete.bat
					Run delete.bat, ,Hide
					ExitApp
				}
			}
			else
				FileDelete, %A_Temp%\DBFFC.tmp\sborka.txt
		}
		else
			Msgbox, 48, Ошибка подключения, Нет подключения к Интернету. Обратитесь к администратору вашей сети!
	}
}
} catch e {
	MsgBox % e "ERROR code 1007 AutoUpdate"
}
Return
;================КОННЕЦ НАЧАЛЬНОГО БЛОКА=====================================


GuiDropFiles(GuiHwnd, FileArray, CtrlHwnd, X, Y)
{
	If A_EventInfo = 1
	{
		for i, Files in FileArray
		{
		try {
			SplitPath, Files,, Dir, Ext, Name
	   ; Сжатие перетаскиваемых файлов
			If (( Ext = "jpg" || Ext = "jpeg" ) && ( A_GuiControl = "T I F F" || A_GuiControl = "P D F" || A_GuiControl = "J P G" || A_GuiControl = " Сжатие" ))
			{
				conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -c 8 -q 50 -multi -o "%Dir%\%Name%_zip.jpg" "%Files%"
				WaitProgress(1)
				RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
				WaitProgress(0, %A_LastError%, %ErrorLevel%)
			}
			else If (( Ext = "pdf" ) && ( A_GuiControl = "T I F F" || A_GuiControl = "P D F" || A_GuiControl = "J P G" || A_GuiControl = " Сжатие" ))
			{
				FileCreateDir, %A_Temp%\DBFFC.tmp\ZipPdfFile
				export = "%A_Temp%\DBFFC.tmp\%gs%"  -sDEVICE=jpeg -dNOPAUSE -r150  -sOutputFile="%A_Temp%\DBFFC.tmp\ZipPdfFile\%Name%`%02d.jpg" "%Files%" -c quit
				conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -D -c 5 -q 50 -multi -o "%dir%\%Name%_zip.pdf" "%A_Temp%\DBFFC.tmp\ZipPdfFile\*.jpg"
				WaitProgress(1)
				RunWait, %comspec% /c %CmdLog% && %export% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
				RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
				FileRemoveDir, %A_Temp%\DBFFC.tmp\ZipPdfFile, 1
				WaitProgress(0, %A_LastError%, %ErrorLevel%)
			}
			else if (( Ext = "tiff" || Ext = "tif" ) && ( A_GuiControl = "T I F F" || A_GuiControl = "P D F" || A_GuiControl = "J P G" || A_GuiControl = "Сжатие" ))
			{
				conv = "%A_Temp%\DBFFC.tmp\%cv%" -out tiff -c 5 -q 50 -multi -o "%Dir%\%Name%_#.tiff" "%Files%"
				WaitProgress(1)
				RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
				WaitProgress(0, %A_LastError%, %ErrorLevel%)
			}
			; Конвертирование перетаскиваемых файлов
			else if (( Ext = "jpg" || Ext = "jpeg" ) && ( A_GuiControl = "TIFF" || A_GuiControl = "PDF" || A_GuiControl = "JPG" || A_GuiControl = "DOC" || A_GuiControl = "PNG" || A_GuiControl = "Конвертирование из" ))
			{
				DnDJpeg = %Files%
				gosub, BJPG
			}
			else if (( Ext = "pdf" ) && ( A_GuiControl = "TIFF" || A_GuiControl = "PDF" || A_GuiControl = "JPG" || A_GuiControl = "DOC" || A_GuiControl = "PNG" ||A_GuiControl =  "Конвертирование из" ))
			{
				DnDPdf = %Files%
				gosub, BPDF
			}
			else if (( Ext = "tiff" || Ext = "tif" ) && ( A_GuiControl = "TIFF" || A_GuiControl = "PDF" || A_GuiControl = "JPG" || A_GuiControl = "DOC" || A_GuiControl = "PNG" || A_GuiControl = "Конвертирование из"))
			{
				DnDTiff = %Files%
				gosub, BTIFF
			}
			else if (( Ext = "doc" || Ext = "docx" || Ext = "html" || Ext = "xml" || Ext = "rtf" || Ext = "mht" || Ext = "txt" ) && (A_GuiControl = "TIFF" || A_GuiControl = "PDF" || A_GuiControl = "JPG" || A_GuiControl = "DOC" || A_GuiControl = "PNG" || A_GuiControl = "Конвертирование из"))
			{
				DnDDoc = %Files%
				gosub, BDOC
			}
			else if (( Ext = "png" ) && (A_GuiControl = "TIFF" || A_GuiControl = "PDF" || A_GuiControl = "JPG" || A_GuiControl = "DOC" || A_GuiControl = "PNG" || A_GuiControl = "Конвертирование из"))
			{
				DnDPng = %Files%
				gosub, BPNG
			}
			else
			{
				MsgBox, 4148, Ошибка, Файлы перемещены не в блок обработки`, либо данный тип файлов не поддерживается. Открыть справку "Функция Drag-and-Drop"?
				IfMsgBox Yes
					Run, "%A_Temp%\DBFFC.tmp\1.chm"
				else return
			}
		} catch e {
			MsgBox % e "ERROR code 1001 DnD_General"
		}
		}
	}

	If (A_EventInfo > 1)
	{
		try {
		global FileList := A_GuiControlEvent
		Sort, FileList
		AllGUICancel()
		gosub, g26
		return
	} catch e {
		MsgBox % e "ERROR code 1005 DnD_General_Event"
		}
	}
Return
}
G26:
try {
	global GuiNum := % GuHi[26].GuiN
	global GuiHigh := % GuHi[26].Hg
	OnMessage(0x0003, "FuncGui")
	OnMessage(0x112, "FuncGui")   ; WM_SYSCOMMAND = 0x112
	DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
	if i := !i
	{
		xI := NumGet(WI, 20, UInt)
		yI := NumGet(WI, 16, UInt)
		Gui, %GuiNum%:Show, x%xI% y%yI% h%GuiHigh% w300
	}
	DllCall("AnimateWindow", Ptr, hGui%GuiNum%, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))    ;выдвигаем/задвигаем окно-слайдер
} catch e {
	MsgBox % e "ERROR code 1006 DnD_Gui28"
	}
return

Dnd_Cancel:
Gui 26:Submit
ControlClick, JPG,Конвертер, , LEFT
return

Dnd_Zip:
Gui 26:Submit
Loop, parse, FileList, `n
{
	try {
	Files := A_LoopField
	SplitPath, Files,, Dir, Ext, Name
	If Ext in jpg,jpeg,JPG,JPEG
	{
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -c 8 -q 50 -multi -o "%Dir%\%Name%_zip.jpg" "%Files%"
		WaitProgress(1)
		RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
		WaitProgress(0)
	}
	else if Ext in pdf,PDF
	{
		FileCreateDir, %A_Temp%\DBFFC.tmp\ZipPdfFile
		export = "%A_Temp%\DBFFC.tmp\%gs%" -sDEVICE=jpeg -dNOPAUSE -r150 -sOutputFile="%A_Temp%\DBFFC.tmp\ZipPdfFile\%Name%`%02d.jpg" "%Files%" -c quit
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -D -c 5 -q 50 -multi -o "%dir%\%Name%_zip.pdf" "%A_Temp%\DBFFC.tmp\ZipPdfFile\*.jpg"
		WaitProgress(1)
		RunWait, %comspec% /c %CmdLog% && %export% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
		RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
		FileRemoveDir, %A_Temp%\DBFFC.tmp\ZipPdfFile, 1
		WaitProgress(0)
	}
	else if Ext in tiff,tif
	{
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out tiff -c 5 -q 50 -multi -o "%Dir%\%Name%_zip.tiff" "%Files%"
		WaitProgress(1)
		RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
		WaitProgress(0)
	}
	} catch e {
		MsgBox % e "ERROR code 1002 DnD_Zip"
	}

}
Return

Dnd_Merge:
{
Gui 26:Submit
try {
Loop, parse, FileList, `n
{
	Files := A_LoopField
	SplitPath, Files,, Dir, Ext, Name
	global mark := Ext
	Dnd_merge_files .= "" Files "" " "
}

If mark in pdf,PDF
{
	merge = "%A_Temp%\DBFFC.tmp\%gs%" -q -dQUIET -dSAFER -dBATCH -dNOPAUSE -dNOPROMPT -sDEVICE=pdfwrite -sOutputFile="%Dir%\%Name%_#.pdf" %Dnd_merge_files%
	WaitProgress(1)
	RunWait, %comspec% /c %CmdLog% && %merge% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
	Dnd_merge_files = ""
	mark = ""
	WaitProgress(0)
}
else If mark in jpg,jpeg
{
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -c 5 -q 85 -multi -o "%Dir%\%Name%.pdf" %Dnd_merge_files%
	WaitProgress(1)
	RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
	Dnd_merge_files = ""
	mark = ""
	WaitProgress(0)
}
else If mark in tif,tiff
{
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out tiff -c 5 -q 85 -multi -o "%Dir%\%Name%_#.tiff" %Dnd_merge_files%
	WaitProgress(1)
	RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
	WaitProgress(0)
}
else MsgBox, "Тип файлов не поддерживается данной программой `nОбратитесь к разработчику для добавления нового типа файлов."

Dnd_merge_files = ""
mark = ""
} catch e {
	MsgBox % e "ERROR code 1003 DnD_Merge"
}
return
}
;================================GUI\===============================================================

BarTime:
SB_SetText(A_Hour . ":" . A_Min, 3)
return

Changelog:
MsgBox, 64, CHANGELOG, #CHANGELOG`nИзменения сборки 347.`n`nСжатие PDF: `n - Добавлено пакетное сжатие через меню блока сжатия.
return
;================================MAIN/=========================================================

;***********************************************************************************************
;*****************************OPTIONS***********************************************************
;***********************************************************************************************
Options:
Gui 27:Show, Center w425 h250 ,Настройки
return

27ButtonСохранить:
try {
GuiControlGet PeriodIzm,,Period
GuiControlGet PageCode,,PageCode
GuiControlGet SkinName,,SkinName
Gui 27:Submit
If SkinName != "NO_SKIN"
	IniWrite, %A_WorkingDir%\she\%SkinName%, %A_WorkingDir%\Config.ini, Skin, SkinPath
else
	IniWrite, %A_WorkingDir%\she\, %A_WorkingDir%\Config.ini, Skin, SkinPath
IniWrite, %PeriodIzm%, %A_WorkingDir%\Config.ini, Options, Period
If Period != % PeriodIzm
	IniWrite, %A_YDay%, %A_WorkingDir%\Config.ini, Options, DataIzm
global PageN := % Arr[PageCode].Page
IniWrite, %PageN%, %A_WorkingDir%\Config.ini, Options, PageN
CmdLog = echo %LogLine% >>"%LogPath%`%date`%.log" 2>>&1 && chcp %PageN% >>"%LogPath%`%date`%.log" 2>>&1
RunWait, %comspec% /c %CmdLog%,, Hide UseErrorLevel
} catch e {
	MsgBox "ERROR code 1019 Save_Btn_27"
}
WinSet , Redraw,, Конвертер
return

27ButtonОтмена:
Gui, 27:Cancel
return

;***********************************************************************************************
;***********************************************************************************************
;***********************************************************************************************

;===========================Меню=================================================================
F1::
HelpAbout:
Run, "%A_Temp%\DBFFC.tmp\1.chm"
return

LogOpen:
Run, "%A_AppData%\Конвертер\Logs"
return

Update:
try {
IfExist, %A_Temp%\DBFFC.tmp\sborka.txt
	FileDelete, %A_Temp%\DBFFC.tmp\sborka.txt
If ConnectedToInternet()
{
	UrlDownloadToFile, %dev_sborka%, %A_Temp%\DBFFC.tmp\sborka.txt
	ELM(%ErrorLevel%, Ошибка загрузки, 1)
	FileRead, new_sborka, %A_Temp%\DBFFC.tmp\sborka.txt
	ELM(%ErrorLevel%, Ошибка чтения, 1)
	If new_sborka > %sborka%
	{
		MsgBox, 52, Обновление, Найдена новая версия программы.`n Текущая версия программы - %Vers%.%sborka%,`n Новая версия программы - %Vers%.%new_sborka%.`n Скачать обновление???
		FileDelete, %A_Temp%\DBFFC.tmp\sborka.txt
		IfMsgBox Yes
		{
			MsgBox,,Конвертер,Спасибо за ваш выбор.
			Run, %Repo%
			bat = ping 127.0.0.1 > NUL`ndel /F /Q ConverterPortable.exe`ndel /F /Q delete.bat
			FileDelete, delete.bat
			FileAppend %bat%, delete.bat
			Run delete.bat, ,Hide
			ExitApp
		}
	}
	else
	{
		MsgBox,,Поздравляю!,Вы используете последнюю версию программы.
		FileDelete, %A_Temp%\DBFFC.tmp\sborka.txt
	}
}
else
{
	Msgbox, 48, Ошибка подключения, Нет подключения к Интернету. Обратитесь к администратору вашей сети!
}
} catch e {
	MsgBox "ERROR code 1004 UPD_module"
}
Return

;==========================Дата===================================================================
Dt:
AllGUICancel()
global GuiNum := % GuHi[21].GuiN
global GuiHigh := % GuHi[21].Hg
OnMessage(0x0003, "FuncGui")
OnMessage(0x112, "FuncGui")   ; WM_SYSCOMMAND = 0x112
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
if i := !i
	Gui, 21:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h140 w300"
DllCall("AnimateWindow", Ptr, hGui21, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))    ;выдвигаем/задвигаем окно-слайдер
return

VI:
FileSelectFile, files, M3,,Редактирование времени изменения файла, Все файлы (*.*) ; M3 = Множественный выбор существующих файлов.
if files =
    return

WinWaitClose Редактирование времени изменения файла
GuiControlGet, Vremya
Gui, 21:Submit
Loop, parse, files, `n
{
    if a_index = 1
		path = %A_LoopField%
	else
		FileSetTime, %Vremya%, %path%\%A_LoopField% , M ; Установить дату изменения (время будет полночь):
}
sleep 500
ControlClick, JPG,Конвертер, , LEFT
MsgBox, 64,Конвертер, Готово!, 1
return

VS:
FileSelectFile, files, M3,,Редактирование времени создания файла, Все файлы (*.*) ; M3 = Множественный выбор существующих файлов.
if files =
    return

WinWaitClose Редактирование времени создания файла
GuiControlGet, Vremya
Gui, 21:Submit
Loop, parse, files, `n
{
    if a_index = 1
		path = %A_LoopField%
	else
		FileSetTime, %Vremya%, %path%\%A_LoopField% , C ; Установить дату изменения (время будет полночь):
}
sleep 500
ControlClick, JPG,Конвертер, , LEFT
MsgBox, 64,Конвертер, Готово!, 1
return

VD:
Gui, 21:Submit
FileSelectFile, files, M3,,Редактирование времени последнего доступа к файлу, Все файлы (*.*) ; M3 = Множественный выбор существующих файлов.
if files =
    return

WinWaitClose Редактирование времени последнего доступа к файлу
GuiControlGet, Vremya
Gui, 21:Submit
Loop, parse, files, `n
{
	if a_index = 1
		path = %A_LoopField%
	else
		FileSetTime, %Vremya%, %path%\%A_LoopField% , A ; Установить дату изменения (время будет полночь):
}
sleep 500
ControlClick, JPG,Конвертер, , LEFT
MsgBox, 64,Конвертер, Готово!, 1
return

;===================================================================================================
;==========================Шифрование===============================================================
Bas:
AllGUICancel()
global GuiNum := % GuHi[25].GuiN
global GuiHigh := % GuHi[25].Hg
OnMessage(0x0003, "FuncGui")
OnMessage(0x112, "FuncGui")   ; WM_SYSCOMMAND = 0x112
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
   if i := !i
      Gui, 25:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h100 w300"
   DllCall("AnimateWindow", Ptr, hGui25, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))    ;выдвигаем/задвигаем окно-слайдер
Return
;===================================================================================================
BasE:
try {
Gui 25:Submit
FileSelectFile, files, 3,,Зашифровать файл, Все файлы (*.*)
if files =
	return
WinWaitClose Зашифровать файл
SplitPath, files, FiNam, Dir, Ext, Name
base = "%A_Temp%\DBFFC.tmp\bsed.exe" -e "%files%" "%A_Temp%\DBFFC.tmp\%FiNam%"
GuiControlGet, Int,, Int
WaitProgress(1)
Loop %Int%
{
	RunWait, %comspec% /c %CmdLog% && %base% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
	FileDelete, "%files%"
	sleep 1000
	FileMove, %A_Temp%\DBFFC.tmp\%FiNam%, %dir%, 1
	sleep 1000
}
WaitProgress(0, %A_LastError%, %ErrorLevel%)
} catch e {
	MsgBox % e "ERROR code 1008 BasE"
}
Return
;===================================================================================================
BasD:
try {
Gui 25:Cancel
FileSelectFile, files, 3,,Дешифровать файл, Все файлы (*.*)
	if files =
	{
		return
	}
WinWaitClose Дешифровать файл
SplitPath, files, FiNam, Dir, Ext, Name
base = "%A_Temp%\DBFFC.tmp\bsed.exe" -d "%files%" "%A_Temp%\DBFFC.tmp\%FiNam%"
GuiControlGet, Int,, Int
WaitProgress(1)
Loop %Int%
{
	RunWait, %comspec% /c %CmdLog% && %base% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
	FileDelete % files
	sleep 1000
	FileMove, %A_Temp%\DBFFC.tmp\%FiNam%, %dir%, 1
	sleep 1000
}
WaitProgress(0, %A_LastError%, %ErrorLevel%)
} catch e {
	MsgBox % e "ERROR code 1009 BasD"
}
Return
;===================================================================================================
Tb2bt:
Gui 25:Cancel
Run, "%A_Temp%\DBFFC.tmp\tb2bt.exe"
Return

;===================================================================================================
;==========================Конвертирование Png======================================================
;===================================================================================================

ButtonPNG:
DnDPng = ""
BPNG:
AllGUICancel()
global GuiNum := % GuHi[22].GuiN
global GuiHigh := % GuHi[22].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")   ; WM_SYSCOMMAND = 0x112
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
   if i := !i
      Gui, 22:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h85 w300"
   DllCall("AnimateWindow", Ptr, hGui22, UInt, 300, UInt, 0x40000|(i ? 1 : 0x10002))    ;выдвигаем/задвигаем окно-слайдер
return
;==========================Конвертирование Jpg======================================================
ButtonJPG:
DnDJpeg = ""
BJPG:
AllGUICancel()
global GuiNum := % GuHi[12].GuiN
global GuiHigh := % GuHi[12].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")   ; WM_SYSCOMMAND = 0x112
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
   if i := !i
      Gui, 12:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h85 w300"
   DllCall("AnimateWindow", Ptr, hGui12, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))    ;выдвигаем/задвигаем окно-слайдер
return
;===========================Конвертирование Pdf=====================================================
ButtonPDF:
DnDPdf = ""
BPDF:
AllGUICancel()
global GuiNum := % GuHi[13].GuiN
global GuiHigh := % GuHi[13].Hg
OnMessage(0x0003, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
   if i := !i
      Gui, 13:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " w300 h90"
   DllCall("AnimateWindow", Ptr, hGui13, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))
return
;=============================Конвертирование Tiff =================================================
ButtonTIFF:
DnDTiff = ""
BTIFF:
AllGUICancel()
global GuiNum := % GuHi[14].GuiN
global GuiHigh := % GuHi[14].Hg
OnMessage(0x0003, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
   if i := !i
      Gui, 14:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h85 w300"
   DllCall("AnimateWindow", Ptr, hGui14, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))   ; выдвигаем/задвигаем окно-слайдер
return
;=============================Конвертирование DJVU =================================================
ButtonDJVU:
AllGUICancel()
global GuiNum := % GuHi[28].GuiN
global GuiHigh := % GuHi[28].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")   ; WM_SYSCOMMAND = 0x112
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
if i := !i
	Gui, %GuiNum%:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h" GuiHigh " w300"
DllCall("AnimateWindow", Ptr, hGui%GuiNum%, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10002))   ; выдвигаем/задвигаем влево окно-слайдер
return

DJ:
try {
Gui 28:Submit
FileSelectFile, files, 3,,Конвертирование DjVu, Все файлы (*.djvu)
if files =
	return
WinWaitClose Конвертирование DjVu
global GuiNum := % GuHi[29].GuiN
global GuiHigh := % GuHi[29].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, %GuiNum%:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h" GuiHigh " w300"
DllCall("AnimateWindow", Ptr, hGui%GuiNum%, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))
} catch e {
	MsgBox % e "ERROR code 1061 DVDJ"
}
return

Save1:
GuiControlGet, pg
Gui 29:Submit
SplitPath, files, FiNam, Dir, Ext, Name
conv = "%DVD%" --output-format=jpeg --page-range=%pg% "%files%" "%Dir%\%Name%.jpg"
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
return

29ButtonОтмена:
Gui 29:Submit
return

DTi:
try {
Gui 28:Submit
FileSelectFile, files, 3,,Конвертирование DjVu, Все файлы (*.djvu)
if files =
	return
WinWaitClose Конвертирование DjVu
global GuiNum := % GuHi[32].GuiN
global GuiHigh := % GuHi[32].Hg
ControlSetText, , Укажите сохраняемые страницы: 1`,3-5`,8. При сохранении всех страниц оставьте поле пустым. ,ahk_id %HwndGui32%
Sleep 500
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, %GuiNum%:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h" GuiHigh " w300"
DllCall("AnimateWindow", Ptr, hGui%GuiNum%, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10003))
} catch e {
	MsgBox % e "ERROR code 1062 DVDTi"
}
return

Splt32:
try {
GuiControlGet, Stran
StringReplace, Stran1, Stran, %A_Space%,,All
Value1 := "."
Value2 := ","
StringReplace, Stran, Stran1, %Value1%,%Value2%,All
Gui 32:Submit
SplitPath, files, FiNam, Dir, Ext, Name
If Stran =
	conv = "%DVD%" --output-format=tif "%files%" "%Dir%\%Name%.tiff"
else
	conv = "%DVD%" --output-format=tif --page-range=%Stran% "%files%" "%Dir%\%Name%.tiff"
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
} catch e {
	MsgBox % e "ERROR code: 1062_DVD_Tif_Splt"
}
return

32ButtonОтмена:
Gui 32:Submit
return

DP:
;~ try {
Gui 28:Submit
FileSelectFile, files, 3,,Конвертирование DjVu, Все файлы (*.djvu)
if files =
	return
WinWaitClose Конвертирование DjVu
SplitPath, files, FiNam, Dir, Ext, Name
conv1 = "%DVD%" --output-format=tif  "%files%" "%A_Temp%\DBFFC.tmp\%Name%.tiff"
conv2 = "%A_WorkingDir%\Sourse\%cv%" -out pdf -c 5 -q 50 -multi -o "%Dir%\%Name%.pdf" "%A_Temp%\DBFFC.tmp\%Name%.tiff"
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv1% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
RunWait, %comspec% /c %CmdLog% && %conv2% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
FileDelete, "%A_Temp%\DBFFC.tmp\%Name%.tiff"
WaitProgress(0, %A_LastError%, %ErrorLevel%)
;~ } catch e {
	;~ MsgBox % e "`n ERROR code 1063 DVDP"
;~ }
return

DPs:
try {
Gui 28:Submit
FileSelectFile, files, 3,,Конвертирование DjVu, Все файлы (*.djvu)
if files =
	return
WinWaitClose Конвертирование DjVu
global GuiNum := % GuHi[30].GuiN
global GuiHigh := % GuHi[30].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, %GuiNum%:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h" GuiHigh " w300"
DllCall("AnimateWindow", Ptr, hGui%GuiNum%, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))
} catch e {
	MsgBox % e "ERROR code 1064 DVDPs"
}
return

Save2:
GuiControlGet, pg
Gui 30:Submit
SplitPath, files, FiNam, Dir, Ext, Name
conv = "%DVD%" --output-format=ps --page-range=%pg% "%files%" "%Dir%\%Name%.ps"
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
return

30ButtonОтмена:
Gui 30:Submit
return

DB:
try {
Gui 28:Submit
FileSelectFile, files, 3,,Конвертирование DjVu, Все файлы (*.djvu)
if files =
	return
WinWaitClose Конвертирование DjVu
global GuiNum := % GuHi[31].GuiN
global GuiHigh := % GuHi[31].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, %GuiNum%:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h" GuiHigh " w300"
DllCall("AnimateWindow", Ptr, hGui%GuiNum%, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))
} catch e {
	MsgBox % e "ERROR code 1065 DVDB"
}
return

Save3:
GuiControlGet, pg
Gui 31:Submit
SplitPath, files, FiNam, Dir, Ext, Name
conv = "%DVD%" --output-format=bmp --page-range=%pg% "%files%" "%Dir%\%Name%.bmp"
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
return

31ButtonОтмена:
Gui 31:Submit
return
;==========================Конвертирование Jpg =====================================================

;==========================Конвертирование Jpg to Pdf===============================================
JP:
If DnDJpeg = ""
{
	FileSelectFile, files, M3,,Конвертация JPG to PDF, Изображения (*.jpg; *.jpeg) ; M3 = Множественный выбор существующих файлов.
	if files =
		return
	WinWaitClose Конвертация JPG to PDF
}

global GuiNum := % GuHi[2].GuiN
global GuiHigh := % GuHi[2].Hg
OnMessage(0x0003, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
	Gui, 2:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " w300 h105"
DllCall("AnimateWindow", Ptr, hGui2, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x00010008))
Gui 12:Show, hide
Return

2ButtonOK:
try {
GuiControlGet, del
GuiControlGet, Zip
Gui, 12:Submit
If del = 1
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -D -c 5 -q %Zip% -multi -o
else
    conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -c 5 -q %Zip% -multi -o

if DnDJpeg = ""
{
	Loop, parse, files, `n
	{
		if a_index = 1
		{
			path = %A_LoopField%
			conv=%conv% "%path%\`%.pdf" "
        }
		else
			conv = %conv%%path%\%A_LoopField%" "
	}
	StringTrimRight, conv, conv, 2
}
else
{
	SplitPath, DnDJpeg,, Dir, Ext, Name
	conv = %conv% "%Dir%\%Name%.pdf" "%DnDJpeg%"
}
Gui, 2:Submit

WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
} catch e {
	MsgBox % e "ERROR code 1010 JP_Module"
}
Return

2ButtonОтмена:
Gui 2:Submit
Return
;==========================Конвертирование Jpg to Ps================================================
JPs:
try {
Gui, 12:Submit
IF DnDJpeg = ""
{
	FileSelectFile, files, M3,,Конвертация JPG to PS, Изображения (*.jpg; *.jpeg) ; M3 = Множественный выбор существующих файлов.
	if files =
		return
	WinWaitClose Конвертация JPG to Ps
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 5 -o
	Loop, parse, files, `n
	{
		if a_index = 1
		{
			path = %A_LoopField%
			conv=%conv% "%path%\`%.ps" "
        }
		else
			conv = %conv%%path%\%A_LoopField%" "
	}
	StringTrimRight, conv, conv, 2
}
else
{
	SplitPath, DnDJpeg,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 5 -o "%Dir%\%Name%.ps" "%DnDJpeg%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
} catch e {
	MsgBox % e "ERROR code 1011 JPs_Module"
}
return
;==========================Конвертирование Jpg to Png================================================
JPn:
try{
Gui, 12:Submit
IF DnDJpeg = ""
{
	FileSelectFile, files, M3,,Конвертация JPG to PNG, Изображения (*.jpg; *.jpeg) ; M3 = Множественный выбор существующих файлов.
	if files =
		return
	WinWaitClose Конвертация JPG to Png
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out png -c 5 -o
	Loop, parse, files, `n
	{
		if a_index = 1
		{
			path = %A_LoopField%
			conv=%conv% "%path%\`%.png" "
		}
		else
			conv = %conv%%path%\%A_LoopField%" "
	}
	StringTrimRight, conv, conv, 2
}
else
{
	SplitPath, DnDJpeg,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out png -c 5 -o "%Dir%\%Name%.png" "%DnDJpeg%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
} catch e {
	MsgBox % e "ERROR code 1012 JPn_Module"
}
return
;==========================Конвертирование Jpg to Jpeg================================================
JJ:
try {
Gui, 12:Submit
IF DnDJpeg = ""
{
	FileSelectFile, files, M3,,Конвертация JPG to JPEG, Изображения (*.jpg; *.jpeg) ; M3 = Множественный выбор существующих файлов.
	if files =
		return
	WinWaitClose Конвертация JPG to Jpeg
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -c 5 -o
	Loop, parse, files, `n
	{
		if a_index = 1
		{
			path = %A_LoopField%
			conv=%conv% "%path%\`%.jpeg" "
        }
		else
			conv = %conv%%path%\%A_LoopField%" "
	}
	StringTrimRight, conv, conv, 2
}
else
{
	SplitPath, DnDJpeg,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 5 -o "%Dir%\%Name%.jpeg" "%DnDJpeg%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
} catch e {
	MsgBox % e "ERROR code 1013 JJ_Module"
}
return
;==========================Конвертирование Jpg to Ico================================================
JI:
try {
Gui, 12:Submit
IF DnDJpeg = ""
{
	FileSelectFile, files, M3,,Конвертация JPG to ICO, Изображения (*.jpg; *.jpeg) ; M3 = Множественный выбор существующих файлов.
	if files =
		return
	WinWaitClose Конвертация JPG to Ico
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ico -c 5 -o
	Loop, parse, files, `n
	{
		if a_index = 1
		{
			path = %A_LoopField%
			conv=%conv% "%path%\`%.ico" "
        }
		else
			conv = %conv%%path%\%A_LoopField%" "
	}
	StringTrimRight, conv, conv, 2
}
else
{
	SplitPath, DnDJpeg,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 5 -o "%Dir%\%Name%.ico" "%DnDJpeg%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
} catch e {
	MsgBox % e "ERROR code 1014 JI_Module"
}
return
;==========================Конвертирование Jpg to Emf================================================
JE:
try {
Gui, 12:Submit
IF DnDJpeg = ""
{
	FileSelectFile, files, M3,,Конвертация JPG to EMF, Изображения (*.jpg; *.jpeg) ; M3 = Множественный выбор существующих файлов.
	if files =
		return
	WinWaitClose Конвертация JPG to EMF
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out emf -c 5 -o
	Loop, parse, files, `n
	{
		if a_index = 1
		{
			path = %A_LoopField%
			conv=%conv% "%path%\`%.emf" "
        }
		else
			conv = %conv%%path%\%A_LoopField%" "
	}
	StringTrimRight, conv, conv, 2
}
else
{
	SplitPath, DnDJpeg,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 5 -o "%Dir%\%Name%.emf" "%DnDJpeg%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
} catch e {
	MsgBox % e "ERROR code 1015 JE_Module"
}
return
;============================Конвертирование Jpg to Tiff============================================
JT:

IF DnDJpeg = ""
{
	FileSelectFile, files, M3,,Конвертация JPG to TIFF, Изображения (*.jpg; *.jpeg) ; M3 = Множественный выбор существующих файлов.
	if files =
		return
	WinWaitClose Конвертация JPG to PDF
}
global GuiNum := % GuHi[4].GuiN
global GuiHigh := % GuHi[4].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
	Gui, 4:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " w300 h105"
	DllCall("AnimateWindow", Ptr, hGui4, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))
Gui 12:Show, hide
return

4ButtonOK:
try {
Gui, 12:Submit
GuiControlGet, Del
GuiControlGet, Zip
Gui, 4:Submit
If del = 1
    conv = "%A_Temp%\DBFFC.tmp\%cv%" -out tiff -D -c 5 -q %Zip% -multi -o
else
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out tiff -c 5 -q %Zip% -multi -o
IF DnDJpeg = ""
{
	Loop, parse, files, `n
	{
		if a_index = 1
		{
			path = %A_LoopField%
			conv=%conv% "%path%\`%.tiff" "
		}
		else
			conv = %conv%%path%\%A_LoopField%" "
	}
	StringTrimRight, conv, conv, 2
}
else
{
	SplitPath, DnDJpeg,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" %conv% "%Dir%\%Name%.tiff" "%DnDJpeg%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
} catch e {
	MsgBox % e "ERROR code 1016 JT_Module"
}
Return

4ButtonОтмена:
Gui 4:Submit
return
;==========================Конвертирование Jpg to Bmp================================================
JB:
try {
Gui, 12:Submit
IF DnDJpeg = ""
{
	FileSelectFile, files, M3,,Конвертация JPG to BMP, Изображения (*.jpg; *.jpeg) ; M3 = Множественный выбор существующих файлов.
	if files =
		return
	WinWaitClose Конвертация JPG to BMP
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out bmp -c 5 -o
	Loop, parse, files, `n
	{
		if a_index = 1
		{
			path = %A_LoopField%
			conv=%conv% "%path%\`%.bmp" "
        }
		else
			conv = %conv%%path%\%A_LoopField%" "
	}
	StringTrimRight, conv, conv, 2
}
else
{
	SplitPath, DnDJpeg,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 5 -o "%Dir%\%Name%.bmp" "%DnDJpeg%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
} catch e {
	MsgBox % e "ERROR code 1017 JB_Module"
}
return
;==========================Конвертирование PNG======================================================================================

;==========================Конвертирование PNG to Pdf===============================================================================
PP:
If DnDPng = ""
{
	FileSelectFile, files, 3,,Конвертация PNG to PDF, Изображения (*.png)
	if files =
		return
	WinWaitClose Конвертация PNG to PDF
}
global GuiNum := % GuHi[23].GuiN
global GuiHigh := % GuHi[23].Hg
OnMessage(0x0003, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
	Gui, 23:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " w300 h105"
DllCall("AnimateWindow", Ptr, hGui23, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x00010008))
Gui 22:Show, hide
Return

23ButtonOK:
GuiControlGet, del
GuiControlGet, Zip
Gui, 23:Submit
If del = 1
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -D -c 5 -q %Zip% -o
else
    conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -c 5 -q %Zip% -o

if DnDPng = ""
{
	SplitPath, files,, dir,,name
	conv = %conv% "%dir%\%name%.pdf" "%files%"
}
else
{
	SplitPath, DnDPng,, Dir, Ext, Name
	conv = %conv% "%Dir%\%Name%.pdf" "%DnDPng%"
}

Gui, 22:Submit
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
Return

23ButtonОтмена:
Gui 23:Submit
Return
;==========================Конвертирование Png to Ps================================================
PPs:
Gui, 22:Submit
IF DnDPng = ""
{
	FileSelectFile, files, 3,,Конвертация PNG to PS, Изображения (*.png)
	if files =
		return
	WinWaitClose Конвертация PNG to PS
	SplitPath, files,, dir,,name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 5 -o "%dir%\%name%.ps" "%files%"
}
else
{
	SplitPath, DnDPng,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 5 -o "%Dir%\%Name%.ps" "%DnDPn%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return
;==========================Конвертирование Png to Jpg================================================
PnJ:
Gui, 22:Submit
IF DnDPng = ""
{
	FileSelectFile, files, 3,,Конвертация Png to Jpg, Изображения (*.png)
	if files =
		return
	WinWaitClose Конвертация Png to Jpg
	SplitPath, files,, dir,,name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -c 5 -o "%dir%\%name%.jpg" "%files%"
}
else
{
	SplitPath, DnDPng,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -c 5 -o "%Dir%\%Name%.jpg" "%DnDPng%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return
;==========================Конвертирование Png to Jpeg================================================
PJe:
Gui, 22:Submit
IF DnDPng = ""
{
	FileSelectFile, files, 3,,Конвертация PNG to JPEG, Изображения (*.png)
	if files =
		return
	WinWaitClose Конвертация PNG to Jpeg
	SplitPath, files,, dir,,name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -c 5 -o "%dir%\%name%.jpeg" "%files%"
}
else
{
	SplitPath, DnDPng,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 5 -o "%Dir%\%Name%.jpeg" "%DnDPng%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return
;==========================Конвертирование Png to Ico================================================
PI:
Gui, 22:Submit
IF DnDPng = ""
{
	FileSelectFile, files, 3,,Конвертация PNG to ICO, Изображения (*.png)
	if files =
		return
	WinWaitClose Конвертация PNG to ICO
	SplitPath, files,, dir,,name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ico -c 5 -o "%dir%\%name%.ico" "%files%"
}
else
{
	SplitPath, DnDPng,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 5 -o "%Dir%\%Name%.ico" "%DnDPng%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return
;==========================Конвертирование Png to Emf================================================
PE:
Gui, 22:Submit
IF DnDPng = ""
{
	FileSelectFile, files, 3,,Конвертация PNG to EMF, Изображения (*.png)
	if files =
		return
	WinWaitClose Конвертация PNG to EMF
	SplitPath, files,, dir,,name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out emf -c 5 -o "%dir%\%name%.emf" "%files%"
}
else
{
	SplitPath, DnDPng,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 5 -o "%Dir%\%Name%.emf" "%DnDPng%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return
;============================Конвертирование Png to Tiff============================================
PT:
IF DnDPng = ""
{
	FileSelectFile, files, 3,,Конвертация PNG to TIFF, Изображения (*.png)
	if files =
		return
	WinWaitClose Конвертация PNG to TIFF
}
global GuiNum := % GuHi[24].GuiN
global GuiHigh := % GuHi[24].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
		Gui, 24:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " w300 h105"
   DllCall("AnimateWindow", Ptr, hGui24, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))
Gui 22:Show, hide
return

24ButtonOK:
Gui, 22:Submit
GuiControlGet, Del
GuiControlGet, Zip
Gui, 24:Submit
If del = 1
    conv = "%A_Temp%\DBFFC.tmp\%cv%" -out tiff -D -c 5 -q %Zip% -o
else
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out tiff -c 5 -q %Zip% -o
IF DnDPng = ""
{
	SplitPath, files,, dir,,name
	conv = %conv% "%dir%\%name%.tiff" "%files%"
}
else
{
	SplitPath, DnDPng,, Dir, Ext, Name
	conv = %conv% "%Dir%\%Name%.tiff" "%DnDPng%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
Return

24ButtonОтмена:
Gui 24:Submit
return
;==========================Конвертирование Png to Bmp================================================
PB:
Gui, 22:Submit
IF DnDPng = ""
{
	FileSelectFile, files, 3,,Конвертация PNG to BMP, Изображения (*.png)
	if files =
		return
	WinWaitClose Конвертация PNG to BMP
	SplitPath, files,, dir,,name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out bmp -c 5 -o "%dir%\%name%.bmp" "%files%"
}
else
{
	SplitPath, DnDPng,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out bmp -c 5 -o "%Dir%\%Name%.bmp" "%DnDPng%"

}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return
;===========================Конвертирование Pdf=====================================================================================

;===========================Конвертирование Pdf to Jpg============================================================================
PJ:
IF DnDPdf = ""
{
	FileSelectFile, files,3,,Конвертация PDF to JPG, Изображения (*.pdf)
	if files =
		return
	SplitPath, files,, dir,,name
	conv = "%A_Temp%\DBFFC.tmp\%gs%"  -sDEVICE=jpeg -dNOPAUSE -r150  -sOutputFile="%dir%\%name%`%02d.jpg" "%files%" -c quit
}
else
{
	SplitPath, DnDPdf,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%gs%"  -sDEVICE=jpeg -dNOPAUSE -r150  -sOutputFile="%Dir%\%Name%`%02d.jpg" "%DnDPdf%" -c quit
}
global GuiNum := % GuHi[3].GuiN
global GuiHigh := % GuHi[3].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
      Gui, 3:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h70 w300"
   DllCall("AnimateWindow", Ptr, hGui3, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))   ; выдвигаем/задвигаем окно-слайдер
Gui 13:Submit
return

3ButtonOK:
GuiControlGet, Del
Gui, 3:Submit
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
	If del = 1
	{
		FileSetAttrib, -R, %files%
		FileDelete, %files%
		sleep 500
		ControlClick, JPG,Конвертер, , LEFT
	}
	else
		ControlClick, JPG,Конвертер, , LEFT
WaitProgress(0, %A_LastError%, %ErrorLevel%)
Return

3ButtonОтмена:
Gui 3:Submit
return
;===========================Конвертирование Pdf to Tiff(цветной)==============================================
PTc:
IF DnDPdf = ""
{
	FileSelectFile, files,3,,Конвертация PDF to Tiff(цветной), Изображения (*.pdf)
	if files =
		return
	SplitPath, files,, dir,,name
	conv = "%A_Temp%\DBFFC.tmp\%gs%"  -sDEVICE=tiff24nc -dNOPAUSE -r150  -sOutputFile="%dir%\%name%.tiff" "%files%" -c quit
}
else
{
	SplitPath, DnDPdf,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%gs%"  -sDEVICE=tiff24nc -dNOPAUSE -r150  -sOutputFile="%Dir%\%Name%.tiff" "%DnDPdf%" -c quit
}
Gui 13:Submit
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return
;===========================Конвертирование Pdf to Tiff(ч/б)==============================================
PTb:
IF DnDPdf = ""
{
	FileSelectFile, files,3,,Конвертация PDF to Tiff(ч/б), Изображения (*.pdf)
	if files =
		return
	SplitPath, files,, dir,,name
	conv = "%A_Temp%\DBFFC.tmp\%gs%"  -sDEVICE=tiffscaled8 -dNOPAUSE -r150  -sOutputFile="%dir%\%name%.tiff" "%files%" -c quit
}
else
{
	SplitPath, DnDPdf,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%gs%"  -sDEVICE=tiffscaled8 -dNOPAUSE -r150  -sOutputFile="%Dir%\%Name%.tiff" "%DnDPdf%" -c quit
}
Gui 13:Submit
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return
;===========================Конвертирование Pdf to Txt==============================================
PTx:
IF DnDPdf = ""
{
	FileSelectFile, files,3,,Конвертация PDF to Txt, Документ (*.pdf)
	if files =
		return
	SplitPath, files,, dir,,name
	conv = "%A_Temp%\DBFFC.tmp\%gs%"  -sDEVICE=txtwrite -dNOPAUSE -r150  -sOutputFile="%dir%\%name%.txt" "%files%" -c quit

}
else
{
	SplitPath, DnDPdf,, Dir, Ext, Name
	conv = "%A_Temp%\DBFFC.tmp\%gs%"  -sDEVICE=txtwrite -dNOPAUSE -r150  -sOutputFile="%Dir%\%Name%.txt" "%DnDPdf%" -c quit
}
Gui 13:Submit
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return
;===========================Конвертирование Pdf to DJVU==============================================
PD:
IF DnDPdf = ""
{
	FileSelectFile, files,3,,Конвертация PDF to DJVU, Документ (*.pdf)
	if files =
		return
	SplitPath, files,, dir,,name
	conv = "%A_WorkingDir%\p2d\pdf2djvu.exe" -o "%dir%\%name%.djvu"   --verbatim-metadata --page-id-template=nb{dpage:04*}.djvu "%files%"
}
else
{
	SplitPath, DnDPdf,, Dir, Ext, Name
	conv = "%A_WorkingDir%\p2d\pdf2djvu.exe" -o "%dir%\%name%.djvu"   --verbatim-metadata --page-id-template=nb{dpage:04*}.djvu "%DnDPdf%"
}
Gui 13:Submit
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return
;=============================Конвертирование Tiff to Jpg===========================================
TJ:
if DnDTiff = ""
{
	FileSelectFile, files, 3,,"Конвертация TIFF to JPG", Изображения (*.tiff; *.tif)
	if files =
		return
	WinWaitClose "Конвертация TIFF to JPG"
}
global GuiNum := % GuHi[5].GuiN
global GuiHigh := % GuHi[5].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, 5:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h115 w300"
DllCall("AnimateWindow", Ptr, hGui5, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))   ; выдвигаем/задвигаем окно-слайдер
Gui 14:Submit
return

5ButtonOK:
GuiControlGet, Del
GuiControlGet, Page
Gui, 5:Submit
if Page = 0
{
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -D -c 8 -q %Zip% -xall -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -c 8 -q %Zip% -xall -o
}
else
{
Page := Page-1
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -D -c 8 -q %Zip% -page %Page% -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -c 8 -q %Zip% -page %Page% -o
}
if DnDTiff = ""
{
	SplitPath, files,, dir,,name
	conv = %conv% "%dir%\%name%-#.jpg" "%files%"
}
else
{
	SplitPath, DnDTiff,, Dir, Ext, Name
	conv = %conv% "%Dir%\%Name%-#.jpg" "%DnDTiff%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
Return

5ButtonОтмена:
Gui 5:Submit
return
;=============================Конвертирование Tiff to Ps===========================================
TPs:
if DnDTiff = ""
{
	FileSelectFile, files, 3,,"Конвертация TIFF to PS", Изображения (*.tiff; *.tif)
	if files =
		return
	WinWaitClose "Конвертация TIFF to PS"
}
global GuiNum := % GuHi[15].GuiN
global GuiHigh := % GuHi[15].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, 15:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h115 w300"
DllCall("AnimateWindow", Ptr, hGui15, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))   ; выдвигаем/задвигаем окно-слайдер
Gui 14:Submit
return

15ButtonOK:
GuiControlGet, Del
GuiControlGet, Page
Gui, 15:Submit
if Page = 0
{
	if Del =1
		conv ="%A_Temp%\DBFFC.tmp\%cv%" -out ps -D -c 8 -q %Zip% -xall -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 8 -q %Zip% -xall -o
}
else
{
Page := Page-1
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -D -c 8 -q %Zip% -page %Page% -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ps -c 8 -q %Zip% -page %Page% -o
}
if DnDTiff = ""
{
	SplitPath, files,, dir,,name
	conv = %conv% "%dir%\%name%-#.ps" "%files%"
}
else
{
	SplitPath, DnDTiff,, Dir, Ext, Name
	conv = %conv% "%Dir%\%Name%-#.ps" "%DnDTiff%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
Return

15ButtonОтмена:
Gui 15:Submit
return
;=============================Конвертирование Tiff to PNG===========================================
TPn:
if DnDTiff = ""
{
	FileSelectFile, files, 3,,"Конвертация TIFF to PNG", Изображения (*.tiff; *.tif)
	if files =
		return
	WinWaitClose "Конвертация TIFF to PNG"
}
global GuiNum := % GuHi[16].GuiN
global GuiHigh := % GuHi[16].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, 16:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h115 w300"
DllCall("AnimateWindow", Ptr, hGui16, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))   ; выдвигаем/задвигаем окно-слайдер
Gui 14:Submit
return

16ButtonOK:
GuiControlGet, Del
GuiControlGet, Page
Gui, 16:Submit
if Page = 0
{
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out png -D -c 8 -q %Zip% -xall -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out png -c 8 -q %Zip% -xall -o
}
else
{
Page := Page-1
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out png -D -c 8 -q %Zip% -page %Page% -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out png -c 8 -q %Zip% -page %Page% -o
}
if DnDTiff = ""
{
	SplitPath, files,, dir,,name
	conv = %conv% "%dir%\%name%-#.png" "%files%"
}
else
{
	SplitPath, DnDTiff,, Dir, Ext, Name
	conv = %conv% "%Dir%\%Name%-#.png" "%DnDTiff%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
Return

16ButtonОтмена:
Gui 16:Submit
return
;=============================Конвертирование Tiff to PDF===========================================
TP:
if DnDTiff = ""
{
	FileSelectFile, files, 3,,"Конвертация TIFF to PDF", Изображения (*.tiff; *.tif)
	if files =
		return
	WinWaitClose "Конвертация TIFF to PDF"
}
global GuiNum := % GuHi[17].GuiN
global GuiHigh := % GuHi[17].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, 17:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h115 w300"
DllCall("AnimateWindow", Ptr, hGui17, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))   ; выдвигаем/задвигаем окно-слайдер
Gui 14:Submit
return

17ButtonOK:
GuiControlGet, Del
GuiControlGet, Page
Gui, 17:Submit
if Page = 0
{
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -D -c 5 -q %Zip% -xall -o ;
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -c 5 -q %Zip% -xall -o    ;
}
else
{
	Page := Page-1
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -D -c 5 -q %Zip% -page %Page% -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -c 5 -q %Zip% -page %Page% -o
}
if DnDTiff = ""
{
	SplitPath, files,, dir,,name
	conv = %conv% "%dir%\%name%-#.pdf" "%files%"
}
else
{
	SplitPath, DnDTiff,, Dir, Ext, Name
	conv = %conv% "%Dir%\%Name%-#.pdf" "%DnDTiff%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
Return

17ButtonОтмена:
Gui 17:Submit
return
;=============================Конвертирование Tiff to Ico===========================================
TI:
if DnDTiff = ""
{
	FileSelectFile, files, 3,,"Конвертация TIFF to Ico", Изображения (*.tiff; *.tif)
	if files =
		return
	WinWaitClose "Конвертация TIFF to Ico"
}
global GuiNum := % GuHi[18].GuiN
global GuiHigh := % GuHi[18].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, 18:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h115 w300"
DllCall("AnimateWindow", Ptr, hGui18, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))   ; выдвигаем/задвигаем окно-слайдер
Gui 14:Submit
return

18ButtonOK:
GuiControlGet, Del
GuiControlGet, Page
Gui, 18:Submit
if Page = 0
{
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ico -D -c 8 -q %Zip% -xall -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ico -c 8 -q %Zip% -xall -o
}
else
{
	Page := Page-1
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ico -D -c 8 -q %Zip% -page %Page% -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out ico -c 8 -q %Zip% -page %Page% -o
}
if DnDTiff = ""
{
	SplitPath, files,, dir,,name
	conv = %conv% "%dir%\%name%-#.ico" "%files%"
}
else
{
	SplitPath, DnDTiff,, Dir, Ext, Name
	conv = %conv% "%Dir%\%Name%-#.ico" "%DnDTiff%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
sleep 500
ControlClick, JPG,Конвертер, , LEFT
Return

18ButtonОтмена:
Gui 18:Submit
return
;=============================Конвертирование Tiff to EMF===========================================
TE:
if DnDTiff = ""
{
	FileSelectFile, files, 3,,"Конвертация TIFF to EMF", Изображения (*.tiff; *.tif)
	if files =
		return
	WinWaitClose "Конвертация TIFF to EMF"
}
global GuiNum := % GuHi[19].GuiN
global GuiHigh := % GuHi[19].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, 19:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h115 w300"
DllCall("AnimateWindow", Ptr, hGui19, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))   ; выдвигаем/задвигаем окно-слайдер
Gui 14:Submit
return

19ButtonOK:
GuiControlGet, Del
GuiControlGet, Page
Gui, 19:Submit
if Page = 0
{
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out emf -D -c 5 -q %Zip% -xall -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out emf -c 5 -q %Zip% -xall -o
}
else
{
	Page := Page-1
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out emf -D -c 5 -q %Zip% -page %Page% -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out emf -c 5 -q %Zip% -page %Page% -o
}
if DnDTiff = ""
{
	SplitPath, files,, dir,,name
	conv = %conv% "%dir%\%name%-#.emf" "%files%"
}
else
{
	SplitPath, DnDTiff,, Dir, Ext, Name
	conv = %conv% "%Dir%\%Name%-#.emf" "%DnDTiff%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
Return

19ButtonОтмена:
Gui 19:Submit
return
;=============================Конвертирование Tiff to BMP===========================================
TB:
if DnDTiff = ""
{
	FileSelectFile, files, 3,,"Конвертация TIFF to BMP", Изображения (*.tiff; *.tif)
	if files =
		return
	WinWaitClose "Конвертация TIFF to BMP"
}
global GuiNum := % GuHi[20].GuiN
global GuiHigh := % GuHi[20].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, 20:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h115 w300"
DllCall("AnimateWindow", Ptr, hGui20, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))   ; выдвигаем/задвигаем окно-слайдер
Gui 14:Submit
return

20ButtonOK:
GuiControlGet, Del
GuiControlGet, Page
Gui, 20:Submit
if Page = 0
{
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out bmp -D -c 5 -q %Zip% -xall -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out bmp -c 5 -q %Zip% -xall -o
}
else
{
	Page := Page-1
	if Del =1
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out bmp -D -c 5 -q %Zip% -page %Page% -o
	else
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out bmp -c 5 -q %Zip% -page %Page% -o
}
if DnDTiff = ""
{
	SplitPath, files,, dir,,name
	conv = %conv% "%dir%\%name%-#.bmp" "%files%"
}
else
{
	SplitPath, DnDTiff,, Dir, Ext, Name
	conv = %conv% "%Dir%\%Name%-#.bmp" "%DnDTiff%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
Return

20ButtonОтмена:
Gui 20:Submit
return
;=============================Сжатие Jpg============================================================
ZJ:
AllGUICancel()
FileSelectFile, files, M3,,Сжатие JPG, Изображения (*.jpg; *.jpeg)
if files =
    return

WinWaitClose Сжатие JPG
global GuiNum := % GuHi[6].GuiN
global GuiHigh := % GuHi[6].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")   ; M_SYSCOMMAND = 0x112
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
if i := !i
	Gui, 6:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " w300 h105"
DllCall("AnimateWindow", Ptr, hGui6, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))
return

6ButtonOK:
GuiControlGet, Del
GuiControlGet, Zip

If del = 1
    conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -D -c 8 -q %Zip% -multi -o
else
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out jpeg -c 8 -q %Zip% -multi -o

Loop, parse, files, `n
{
    if a_index = 1
	{
		path = %A_LoopField%
		conv=%conv% "%path%\`%.jpg" "
    }
	else
		conv = %conv%%path%\%A_LoopField%" "
}
Gui, 6:Submit

StringTrimRight, conv, conv, 2
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
Return

6ButtonОтмена:
Gui 6:Submit
return
;==============================Блок сжатия и т.д. Pdf===============================================
ZP:
AllGUICancel()
global GuiNum := % GuHi[9].GuiN
global GuiHigh := % GuHi[9].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")   ; WM_SYSCOMMAND = 0x112
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
if i := !i
	Gui, 9:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h80 w300"
DllCall("AnimateWindow", Ptr, hGui9, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))    ;выдвигаем/задвигаем окно-слайдер
return

9ButtonСклеить:
Gui 9:Submit
{
FileSelectFile, files, M3,,Обработка PDF,PDF Files (*.pdf)
if files =
    return
merge = "%A_Temp%\DBFFC.tmp\%gs%" -q -dQUIET -dSAFER -dBATCH -dNOPAUSE -dNOPROMPT -sDEVICE=pdfwrite -sOutputFile=

Loop, parse, files, `n
{
    if (a_index = 1)
		path = %A_LoopField%
	else if (a_index = 2)
	{
		temp = %merge%"%path%\#%A_LoopField%"
		merge = %temp% "%path%\%A_LoopField%"
	}
	else
		merge = %merge% "%path%\%A_LoopField%"
}
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %merge% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
}
Return

9ButtonРазрезать:
Gui 9:Submit

FileSelectFile, files,3,,Разрезать PDF, Изображения (*.pdf)
if files =
    return
SplitPath, files,, dir,,name
WinWaitClose Разрезать PDF
global GuiNum := % GuHi[10].GuiN
global GuiHigh := % GuHi[10].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")   ; WM_SYSCOMMAND = 0x112
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, 10:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h115 w300"
DllCall("AnimateWindow", Ptr, hGui10, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))
return

Splt10:
GuiControlGet, Stran

Value1 := ". "
Value2 := ", "
Value3 := "/ "
Value4 := "."
Value5 := ","
Value6 := "/"
StringReplace, Stran1, Stran, %Value1%,%A_Space%, All
StringReplace, Stran2, Stran1, %Value2%,%A_Space%, All
StringReplace, Stran3, Stran2, %Value3%,%A_Space%, All
StringReplace, Stran4, Stran3, %Value4%,%A_Space%, All
StringReplace, Stran5, Stran4, %Value5%,%A_Space%, All
StringReplace, Stran6, Stran5, %Value6%,%A_Space%, All

split = "%A_Temp%\DBFFC.tmp\pdftk.exe" "%files%" cat %Stran6% output "%dir%\%name%New.pdf"
Gui 10:Submit

WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %split% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
Return

9ButtonСжать:
Gui 9:Submit

FileSelectFile, files,M3,,Сжатие PDF, Изображения (*.pdf)
if files =
    return

WinWaitClose Сжатие PDF
global GuiNum := % GuHi[8].GuiN
global GuiHigh := % GuHi[8].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
Gui, %GuiNum%:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h" GuiHigh " w300"
DllCall("AnimateWindow", Ptr, hGui%GuiNum%, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))
return

8ButtonOK:
GuiControlGet, Del
GuiControlGet, Zip

WaitProgress(1)
Loop, parse, files, `n
{
    if (a_index = 1)
		path = %A_LoopField%
	else if (a_index >= 2)
	{
		FileCreateDir, %A_Temp%\{41243843A44243E4402042643E4392041643843221}
		SplitPath, A_LoopField,,,,name
		export = "%A_Temp%\DBFFC.tmp\%gs%"  -sDEVICE=jpeg -dNOPAUSE -r150  -sOutputFile="%A_Temp%\{41243843A44243E4402042643E4392041643843221}\%name%`%02d.jpg" "%path%\%A_LoopField%" -c quit
		RunWait, %comspec% /c %CmdLog% && %export% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
		conv = "%A_Temp%\DBFFC.tmp\%cv%" -out pdf -D -c 5 -q %Zip% -multi -o "%path%\%name%#.pdf" "%A_Temp%\{41243843A44243E4402042643E4392041643843221}\*.jpg"
		RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
		FileRemoveDir, %A_Temp%\{41243843A44243E4402042643E4392041643843221}, 1

		If del = 1
		{
			FileSetAttrib, -R, %path%\%A_LoopField%
			FileDelete, %path%\%A_LoopField%
			sleep 500
		}
	}
}
WaitProgress(0, %A_LastError%, %ErrorLevel%)

Gui, %GuiNum%:Submit
ControlClick, JPG, Конвертер, , LEFT
Return

;===================================================================================================
MD:
Gui 9:Submit

FileSelectFile, files,3,,Изменение метаданных PDF, Изображения (*.pdf)
if files =
    return
SplitPath, files,, dir,,name
IfExist, "%A_Temp%\DBFFC.tmp\metadata.txt"
    FileDelete, "%A_Temp%\DBFFC.tmp\metadata.txt"
metdo= "%A_Temp%\DBFFC.tmp\pdftk.exe" "%files%" dump_data output %A_Temp%\DBFFC.tmp\metadata.txt
metdi= "%A_Temp%\DBFFC.tmp\pdftk.exe" "%files%" update_info %A_Temp%\DBFFC.tmp\metadata.txt output "%dir%\%name%01.pdf"
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %metdo% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
sleep 2500
;===================================================================================================

;==========================================/BLOC====================================================


MetaFile = %A_Temp%\DBFFC.tmp\metadata.txt
FileRead, Meta1, %MetaFile%
If ErrorLevel <> 0
{
	MsgBox Нельзя открыть метаданные.
    return
}
Gui, My:Show,, METADATA
Gui, My:Default
WinWait, METADATA
GuiControl,, Meta, %Meta1% ; Помещаем текст в элемент управления.
return

MyButtonСохранить:  ; Вызывающий оператор гарантирует, что MetaFile имеет значение.
IfExist, %MetaFile%
{
    FileDelete, %MetaFile%
    If ErrorLevel <> 0
    {
        MsgBox Попытка сохранить метаданные потерпела неудачу.
        return
    }
}
Gui, My:Default
GuiControlGet, Meta ; Извлекаем содержимое поля редактирования.
FileAppend, %Meta%, %MetaFile% ; Сохраняем содержимое в файле.
Gui My:Submit
sleep 500
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %metdi% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
GUI Default
sleep 500
ControlClick, PDF,Конвертер, , LEFT
sleep 2500
FileDelete, %A_Temp%\DBFFC.tmp\metadata.txt
WaitProgress(0, %A_LastError%, %ErrorLevel%)
return

MyGuiSize:
Gui, My:Default
if ErrorLevel = 1 ; Окно минимизировано.  Ничего делать не нужно.
    return
; Иначе, был изменен размер окна или окно было увеличено до максимального размера.
; Чтобы поле редактирования соответствовало новому размеру окна, изменяем его размер.
NewWidth := A_GuiWidth-5
NewHeight := A_GuiHeight-20
GuiControl, Move, Meta, W%NewWidth% H%NewHeight%
return

MyButtonВыход:
MyGuiClose: ; при нажатии кнопки закрытия окна
MyGuiEscape: ; при нажатии кнопки ESC
FileDelete, %A_Temp%\DBFFC.tmp\metadata.txt
Gui My:Submit
GUI Default
sleep 500
ControlClick, PDF,Конвертер, , LEFT
return
;===============================BLOC\===============================================================
DSh:
{
MsgBox, 35, Защита,Хотите защитить документ? Если нет, то снятие защиты.
	IfMsgBox Yes
	{
		Gui 9:Submit
		FileSelectFile, files,3,,Защита PDF, Изображения (*.pdf)
		if files =
			return
		SplitPath, files,, dir,,name
		InputBox, pass, Введите пароль, Введите пароль для установки защиты:,HIDE,250,130
		Sh= "%A_Temp%\DBFFC.tmp\pdftk.exe" "%files%" output "%dir%\%name%-secured.pdf" owner_pw %pass%
		WaitProgress(1)
		RunWait, %comspec% /c %CmdLog% && %Sh% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
		WaitProgress(0, %A_LastError%, %ErrorLevel%)
		ControlClick, JPG,Конвертер, , LEFT
		return
	}
	IfMsgBox No
	{
		Gui 9:Submit
		FileSelectFile, files,3,,Защита PDF, Изображения (*.pdf)
		if files =
			return
		SplitPath, files,, dir,,name
		InputBox, pass, Введите пароль, Введите пароль для снятия защиты:,HIDE,250,130
		DeSh= "%A_Temp%\DBFFC.tmp\pdftk.exe" "%files%" input_pw %pass% output "%dir%\%name%-norm.pdf"
		WaitProgress(1)
		RunWait, %comspec% /c %CmdLog% && %DeSh% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
		WaitProgress(0, %A_LastError%, %ErrorLevel%)
		ControlClick, JPG,Конвертер, , LEFT
		return
	}
	else
		return
}
return

Vost:
{
FileSelectFile, files,3,,Восстановление поврежденного PDF, Изображения (*.pdf)
if files =
    return
SplitPath, files,, dir,,name
}
fix= "%A_Temp%\DBFFC.tmp\pdftk.exe" "%files%" output "%dir%\%name%-Fixed.pdf"
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %fix% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return

10ButtonОтмена:
Gui 10:Submit
9ButtonОтмена:
Gui 9:Submit
8ButtonОтмена:
Gui 8:Submit
return
;===============================Сжатие Tiff=========================================================
ZT:
AllGUICancel()
FileSelectFile, files, 3,,Сжатие TIFF, Изображения (*.tiff; *.tif)
if files =
    return
WinWaitClose Сжатие TIFF
global GuiNum := % GuHi[7].GuiN
global GuiHigh := % GuHi[7].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")

DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
if i := !i
	Gui, 7:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " w300 h 105"
DllCall("AnimateWindow", Ptr, hGui7, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))
return

7ButtonOK:
GuiControlGet, Del
GuiControlGet, Zip
Gui 12:Submit

If del = 1
    conv = "%A_Temp%\DBFFC.tmp\%cv%" -out tiff -D -c 5 -q %Zip% -multi -o
else
	conv = "%A_Temp%\DBFFC.tmp\%cv%" -out tiff -c 5 -q %Zip% -multi -o

SplitPath, files,, dir,,name
conv = %conv% "%dir%\%name%-#.tiff" "%files%"

Gui 7:Submit
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %conv% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
Return

7ButtonОтмена:
Gui 7:Submit
return
;===============================Конвертирование DOC файлов==========================================
DOC:
DnDDoc = ""
BDOC:
AllGUICancel()
VarSetCapacity(WI, 64)
global GuiNum := % GuHi[11].GuiN
global GuiHigh := % GuHi[11].Hg
OnMessage(0x3, "FuncGui")
OnMessage(0x112, "FuncGui")   ; WM_SYSCOMMAND = 0x112
DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
if i := !i
	Gui, 11:Show, % "x" NumGet(WI, 20, "UInt") " y" NumGet(WI, 16, "UInt") " h100 w300"
DllCall("AnimateWindow", Ptr, hGui11, UInt, 300, UInt, 0x00040000|(i ? 1 : 0x10008))    ;выдвигаем/задвигаем окно-слайдер
return

CHtml:
Gui 11:Submit
If DnDDoc = ""
{
	FileSelectFile, files, 3,,Конвертирование документов, Поддерживаемые форматы (*.doc; *.docx; *.rtf; *.html; *.xml (WordML); *.mht; *.txt)
	if files =
		return
	WinWaitClose Конвертирование документов
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%files%" /F:HTML /v
}
else
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%DnDDoc%" /F:HTML /v
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %doc% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return

CRtf:
Gui 11:Submit
If DnDDoc = ""
{
	FileSelectFile, files, 3,,Конвертирование документов, Поддерживаемые форматы (*.doc; *.docx; *.rtf; *.html; *.xml (WordML); *.mht; *.txt)
	if files =
		return
	WinWaitClose Конвертирование документов
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%files%" /F:RTF /v
}
else
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%DnDDoc%" /F:RTF /v
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %doc% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return

CMht:
Gui 11:Submit
If DnDDoc = ""
{
	FileSelectFile, files, 3,,Конвертирование документов, Поддерживаемые форматы (*.doc; *.docx; *.rtf; *.html; *.xml (WordML); *.mht; *.txt)
	if files =
		return
	WinWaitClose Конвертирование документов
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%files%" /F:MHT /v
}
else
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%DnDDoc%" /F:MHT /v
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %doc% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return

CTxt:
Gui 11:Submit
If DnDDoc = ""
{
	FileSelectFile, files, 3,,Конвертирование документов, Поддерживаемые форматы (*.doc; *.docx; *.rtf; *.html; *.xml (WordML); *.mht; *.txt)
	if files =
		return
	WinWaitClose Конвертирование документов
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%files%" /F:TXT /v
}
else
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%DnDDoc%" /F:TXT /v
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %doc% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return

CXml:
Gui 11:Submit
If DnDDoc = ""
{
	FileSelectFile, files, 3,,Конвертирование документов, Поддерживаемые форматы (*.doc; *.docx; *.rtf; *.html; *.xml (WordML); *.mht; *.txt)
	if files =
		return
	WinWaitClose Конвертирование документов
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%files%" /F:XML /v
}
else
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%DnDDoc%" /F:XML /v
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %doc% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return

CPdf:
Gui 11:Submit
If DnDDoc = ""
{
	FileSelectFile, files, 3,,Конвертирование документов, Поддерживаемые форматы (*.doc; *.docx; *.rtf; *.html; *.xml (WordML); *.mht; *.txt)
	if files =
		return
	WinWaitClose Конвертирование документов
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%files%" /F:PDF /v
}
else
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%DnDDoc%" /F:PDF /v
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %doc% >>"%LogPath%`%date`%.log" 2>>&1,,Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return

CXps:
Gui 11:Submit
If DnDDoc = ""
{
	FileSelectFile, files, 3,,Конвертирование документов, Поддерживаемые форматы (*.doc; *.docx; *.rtf; *.html; *.xml (WordML); *.mht; *.txt)
	if files =
		return
	WinWaitClose Конвертирование документов
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%files%" /F:XPS /v
}
else
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%DnDDoc%" /F:XPS /v
WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %doc% >>"%LogPath%`%date`%.log" 2>>&1,, Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
ControlClick, JPG,Конвертер, , LEFT
return

CFb2:
Gui 11:Submit
If DnDDoc = ""
{
	FileSelectFile, files, 3,,Конвертирование документов, Поддерживаемые форматы (*.doc; *.docx; *.rtf; *.html; *.xml (WordML); *.mht; *.txt)
	if files =
		return
	WinWaitClose Конвертирование документов
	SplitPath, files,, dir,,name
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%files%" /f:fb2 /E:1251 /XSL:"%A_Temp%\DBFFC.tmp\doc2fb.xsl" /v
}
else
{
	SplitPath, DnDDoc,, Dir, Ext, Name
	doc = "%A_Temp%\DBFFC.tmp\doc.bat" "%DnDDoc%" /f:fb2 /E:1251 /XSL:"%A_Temp%\DBFFC.tmp\doc2fb.xsl" /v
}

WaitProgress(1)
RunWait, %comspec% /c %CmdLog% && %doc% >>"%LogPath%`%date`%.log" 2>>&1, , Hide UseErrorLevel
WaitProgress(0, %A_LastError%, %ErrorLevel%)
return

Otm:
Gui 11:Submit
return
;===================================================================================================
;===================================================================================================
AllGUICancel()
{
	gui, 9:Submit
	gui, 11:Submit
	gui, 12:Submit
	gui, 13:Submit
	gui, 14:Submit
	gui, 21:Submit
	gui, 22:Submit
	gui, 23:Submit
	gui, 24:Submit
	gui, 25:Submit
	Gui, 27:submit
	Gui, 28:submit
	return
}
;===================================================================================================
;================================FUNNCTION/=========================================================
GuiEscape:
MsgBox, 308, Завершение работы, Вы точно хотите закрыть программу?
IfMsgBox Yes
	ExitApp
Return

GetOut:
GuiClose:
ButtonВыход:
GEX:
SkinForm(0)
FileRemoveDir, %A_Temp%\DBFFC.tmp, 1

ExitApp
