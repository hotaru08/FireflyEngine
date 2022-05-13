@echo OFF

echo.
rmdir "dependencies/imgui" /S /Q
git clone https://github.com/ocornut/imgui.git "dependencies/imgui"
if %ERRORLEVEL% GEQ 1 goto :PAUSE
echo.
pause
