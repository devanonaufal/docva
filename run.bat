
@echo off
REM Docva GUI Launcher for Windows
REM Auto-detects Python and runs main_gui.py

echo Starting Docva Document Generator...
echo.

REM Try to find Python in PATH
where python >nul 2>&1
if %errorlevel% equ 0 (
    echo Found Python in PATH
    python "%~dp0main_gui.py"
    goto :end
)

REM Try common Python installation paths
if exist "C:\Python313\python.exe" (
    echo Found Python at C:\Python313
    "C:\Python313\python.exe" "%~dp0main_gui.py"
    goto :end
)

if exist "C:\Python312\python.exe" (
    echo Found Python at C:\Python312
    "C:\Python312\python.exe" "%~dp0main_gui.py"
    goto :end
)

if exist "C:\Python311\python.exe" (
    echo Found Python at C:\Python311
    "C:\Python311\python.exe" "%~dp0main_gui.py"
    goto :end
)

if exist "C:\Python310\python.exe" (
    echo Found Python at C:\Python310
    "C:\Python310\python.exe" "%~dp0main_gui.py"
    goto :end
)

REM Try user AppData Python
if exist "%LOCALAPPDATA%\Programs\Python\Python313\python.exe" (
    echo Found Python in AppData
    "%LOCALAPPDATA%\Programs\Python\Python313\python.exe" "%~dp0main_gui.py"
    goto :end
)

REM Python not found
echo.
echo ERROR: Python not found!
echo Please install Python 3.10+ from https://www.python.org/
echo Or make sure python is in your PATH
echo.
pause
goto :end

:end
if %errorlevel% neq 0 (
    echo.
    echo Application exited with error code: %errorlevel%
    pause
)