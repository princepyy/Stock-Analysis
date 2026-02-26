@echo off
setlocal

:: Set Tools Path
set "TOOLS_DIR=%~dp0tools"

:: Find Node directory
for /d %%D in ("%TOOLS_DIR%\node-v*") do set "NODE_HOME=%%D"
if not defined NODE_HOME (
    echo [ERROR] Node.js not found in tools directory.
    pause
    exit /b 1
)

:: Find Maven directory
for /d %%D in ("%TOOLS_DIR%\apache-maven*") do set "MAVEN_HOME=%%D"
if not defined MAVEN_HOME (
    echo [ERROR] Maven not found in tools directory.
    pause
    exit /b 1
)

:: Set Paths
set "PATH=%NODE_HOME%;%MAVEN_HOME%\bin;%PATH%"

echo ===================================================
echo   Starting Stock Analyzer Dev Environment
echo ===================================================
echo [INFO] Using Node: %NODE_HOME%
echo [INFO] Using Maven: %MAVEN_HOME%
echo.

:: Check versions
call node -v
call mvn -v

echo.
echo [1/3] Installing Frontend Dependencies...
cd frontend
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Frontend install failed!
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo [2/3] Starting Backend (Spring Boot)...
start "Backend Server" cmd /c "cd /d ..\backend && mvn spring-boot:run"
timeout /t 10 >nul

echo.
echo [3/3] Starting Frontend (React)...
start "Frontend Client" cmd /c "npm run dev"

echo.
echo ===================================================
echo   Application Started!
echo   Frontend: http://localhost:3000
echo   Backend:  http://localhost:8080
echo ===================================================
echo.
echo Press any key to stop servers (manually close the opened windows)...
pause
