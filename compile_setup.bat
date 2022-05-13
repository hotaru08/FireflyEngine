@echo OFF

powershell write-host -fore White ------------------------------------------------------------------------------------------------------
powershell write-host -fore Yellow Generating Firefly Project ...
powershell write-host -fore White ------------------------------------------------------------------------------------------------------
echo.

:DOWNLOAD_DEPENDANCIES
powershell write-host -fore White ------------------------------------------------------------------------------------------------------
powershell write-host -fore Yellow FIREFLY - DOWNLOADING DEPENDANCIES
powershell write-host -fore White ------------------------------------------------------------------------------------------------------

start /WAIT /B get_dependancies.bat
echo.

:GENERATE_ENGINE
powershell write-host -fore White ------------------------------------------------------------------------------------------------------
powershell write-host -fore Yellow FIREFLY - GENERATING PROJECTS
powershell write-host -fore White ------------------------------------------------------------------------------------------------------

start /WAIT /B generate_projects.bat
echo.

:DONE
powershell write-host -fore White ------------------------------------------------------------------------------------------------------
powershell write-host -fore White FIREFLY - FINISHED DOWNLOADING, SUCCESS!
powershell write-host -fore White ------------------------------------------------------------------------------------------------------
goto :PAUSE

:ERROR
powershell write-host -fore Red ------------------------------------------------------------------------------------------------------
powershell write-host -fore Red XECS - ERROR!!
powershell write-host -fore Red ------------------------------------------------------------------------------------------------------

:PAUSE
rem if no one give us any parameters then we will pause it at the end, else we are assuming that another batch file called us
if %1.==. pause