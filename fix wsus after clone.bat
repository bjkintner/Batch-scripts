REG Delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v SusClientId  /f
REG Delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v SusClientIdValidation  /f
REG Add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUServer /t REG_SZ /d 
http://SERVERNAME HERE:8530 /F

REG Add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUStatusServer /t REG_SZ /d http:// SERVERNAME HERE /F
  
gpupdate
net stop wuauserv /y
net stop BITS /y
rd C:\WINDOWS\SoftwareDistribution /s /Q
del "c:\windows\windowsupdate.log"
regsvr32 WUAPI.DLL /s
regsvr32 WUAUENG.DLL /s
regsvr32 WUAUENG1.DLL /s
regsvr32 ATL.DLL /s
regsvr32 WUCLTUI.DLL /s
regsvr32 WUPS.DLL /s
regsvr32 WUPS2.DLL /s
regsvr32 WUWEB.DLL /s
regsvr32 msxml3.dll /s
net start wuauserv /y
wuauclt.exe /resetauthorization /detectnow