@ECHO off
GOTO GETADMINWRITES >NUL

:START
CD "%~dp0"
CALL:STARTTIME
SET "Title=Build XBMC4Xbox Redux ( Rocky5 Edits )"
SET "DEST=BUILD Rocky5 Edits"
COLOR 60
TITLE %Title%
CLS

(
	FOR /f "tokens=2,* delims==" %%a in ('findstr /b /i /l "IP" "Xbox_FTP.ini"') do SET "IPADDRESS=%%a"
	FOR /f "tokens=2,* delims==" %%a in ('findstr /b /i /l "DEST" "Xbox_FTP.ini"') do SET "FTPDEST=%%a"
) >nul 2>&1

SET XBE_PATCH=tools\xbepatch\xbepatch.exe

SET COMPRESS_FILE=XBMC4XBOX.zip
SET COMPRESS=C:\Program Files\7-zip\7z.exe
SET COMPRESS_OPTS=a %COMPRESS_FILE%

SET Silent=0
SET SkipCompression=0
SET Clean=1
SET Compile=1

IF "%VS71COMNTOOLS%"=="" (
	SET NET="%ProgramFiles%\Microsoft Visual Studio .NET 2003\Common7\IDE\devenv.com"
) ELSE (
	SET NET="%VS71COMNTOOLS%\..\IDE\devenv.com"
)

IF NOT EXIST %NET% (
	CALL:ERROR "Visual Studio .NET 2003 was not found."
	GOTO:EOF
)

SET VS_PATH=.
SET VS_SOL=xbmc.sln
SET VS_CONF=Release
SET VS_BIN=default.xbe

IF %Silent% EQU 0 (
	IF EXIST %VS_PATH%\%VS_CONF%\%VS_BIN% (
		SET Clean=0
	)
)

IF %Compile% EQU 1 (
	CALL:COMPILE
)

CALL:MAKE_BUILD %DEST%

PAUSE
GOTO:EOF

:COMPILE
	ECHO Wait while preparing the build.
	ECHO ------------------------------------------------------------
	IF %Clean% EQU 1 (
		ECHO Cleaning Solution...
		%NET% %VS_PATH%\%VS_SOL% /clean %VS_CONF%
		DEL %VS_PATH%\%VS_CONF%\xbmc.map 2>NUL
	)
	ECHO Compiling Solution...
	%NET% %VS_PATH%\%VS_SOL% /build %VS_CONF%
	IF NOT EXIST %VS_PATH%\%VS_CONF%\%VS_BIN% (
		CALL:ERROR "%VS_BIN% failed to build!    See .\%VS_CONF%\BuildLog.htm FOR details."
		PAUSE
		EXIT
	)
	ECHO ------------------------------------------------------------
	GOTO:EOF

:MAKE_BUILD
	findstr /C:"Creating Xbox Image..." "%VS_CONF%\BuildLog.htm" >nul
	IF %ERRORLEVEL%==0 (
		RMDIR "%DEST%" /S /Q
		IF NOT EXIST "%DEST%" md "%DEST%"

		ECHO Copying files to %DEST% ...
		xcopy /Y "%VS_PATH%\%VS_CONF%\%VS_BIN%" "%DEST%\" >nul

		ECHO - XBE Patching %VS_PATH%\%VS_CONF%\%VS_BIN%
		%XBE_PATCH% "%DEST%\%VS_BIN%"
		ECHO - Patching Done!

		CALL:STOPTIME

		SET "FTP_HOST=%IPADDRESS%"
		SET "FTP_USER=xbox"
		SET "FTP_PASS=xbox"
		SET "FTP_DEST=%FTPDEST%"

		IF "%clean%"=="0" (
			IF NOT "%IPADDRESS%"=="" (
				ECHO - Uploading %VS_BIN% to %FTP_DEST%
				CALL:FTP
			)
		)

		PAUSE
		GOTO START
	) ELSE (
		CALL:STOPTIME
		ECHO - Build failed retry?
		PAUSE
		GOTO START
	)

:STARTTIME
  FOR /F "tokens=1-4 delims=:,." %%a in ("%TIME%") do (
    SET startHour=%%a
    SET startMinute=%%b
    SET startSecond=%%c
    SET startMillisecond=%%d
  )
  GOTO:EOF

:STOPTIME
	FOR /F "tokens=1-4 delims=:,." %%a in ("%TIME%") do (
		SET endHour=%%a
		SET endMinute=%%b
		SET endSecond=%%c
		SET endMillisecond=%%d
	)

	IF "%endHour%"==" 0" SET endHour=00
	IF "%endHour%"==" 1" SET endHour=01
	IF "%endHour%"==" 2" SET endHour=02
	IF "%endHour%"==" 3" SET endHour=03
	IF "%endHour%"==" 4" SET endHour=04
	IF "%endHour%"==" 5" SET endHour=05
	IF "%endHour%"==" 6" SET endHour=06
	IF "%endHour%"==" 7" SET endHour=07
	IF "%endHour%"==" 8" SET endHour=08
	IF "%endHour%"==" 9" SET endHour=09

	SET /A startTotal=(startHour * 360000) + (startMinute * 6000) + (startSecond * 100) + startMillisecond
	SET /A endTotal=(endHour * 360000) + (endMinute * 6000) + (endSecond * 100) + endMillisecond

	IF %endTotal% LSS %startTotal% (
		SET /A endTotal+=8640000
	)

	SET /A elapsed=endTotal - startTotal
	SET /A hours=elapsed / 360000
	SET /A minutes=(elapsed %% 360000) / 6000
	SET /A seconds=(elapsed %% 6000) / 100

	TITLE %Title% Build Time: %minutes% Mins %seconds% Secs
	GOTO:EOF

:FTP
	SET "MAX_RETRIES=5"
	SET "RETRY_COUNT=1"

	(
		ECHO open %FTP_HOST%
		ECHO user %FTP_USER%
		ECHO %FTP_PASS%
		ECHO binary
		ECHO cd "%FTP_DEST%"
		ECHO put "%DEST%\%VS_BIN%"
		REM ECHO site restartapp
		ECHO bye
	) > ftp_temp.txt

	:FTP_RETRY
	ftp -n -s:ftp_temp.txt > ftp_log.txt 2>&1

	IF EXIST ftp_log.txt (
		findstr /C:"Transfer OK" ftp_log.txt >nul
		IF NOT ERRORLEVEL 1 (
			ECHO - Upload successful
			GOTO CLEANUP_FTP
			GOTO:EOF
		)
		findstr /C:"Not connected." /C:"Connection timed out" /C:"ftp: connect" ftp_log.txt >nul
		IF NOT ERRORLEVEL 1 (
			SET /A RETRY_COUNT+=1
			ECHO - FTP connection failed. Attempt %RETRY_COUNT% of %MAX_RETRIES%.
			IF %RETRY_COUNT% GEQ %MAX_RETRIES% (
				ECHO - Max retries reached. Giving up.
				GOTO CLEANUP_FTP_TEMP
				GOTO:EOF
			)
			GOTO FTP_RETRY
		)
	) ELSE (
		ECHO - FTP log missing. Upload may have failed.
		GOTO CLEANUP_FTP
	)

:CLEANUP_FTP
    IF EXIST ftp_log.txt DEL ftp_log.txt
    IF EXIST ftp_temp.txt DEL ftp_temp.txt
    GOTO:EOF
	
:CLEANUP_FTP_TEMP
    IF EXIST ftp_temp.txt DEL ftp_temp.txt
    GOTO:EOF

:ERROR
	ECHO ------------------------------------------------------------
	ECHO !-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-
	ECHO        ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR
	ECHO !-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-
	ECHO ERROR %DEST%
	ECHO ------------------------------------------------------------
	GOTO:EOF

:GETADMINWRITES
	REM    --> Check FOR permissions
	IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
		>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
	) ELSE (
		>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	)
	REM --> IF error flag set, we do not have admin.
	IF '%errorlevel%' NEQ '0' (
		ECHO Requesting administrative privileges...
		GOTO UACPROMPT
	) ELSE ( GOTO GOTADMIN )

:UACPROMPT
	ECHO SET UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	SET params = %*:"=""
	ECHO UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs"
	del "%temp%\getadmin.vbs"
	exit /B

:GOTADMIN
	pushd "%CD%"
	CD /D "%~dp0"
	GOTO START