@echo off
setlocal enabledelayedexpansion
title Ecommerce Backend - Git Auto Commit and PR Merge
cd /d "%~dp0"

echo ======================================================================
echo    ECOMMERCE BACKEND - KHOI DONG TIEN TRINH GIT PUSH VA PULL REQUEST
echo ======================================================================
echo.
echo Dang khoi chay qua PowerShell de ho tro Unicode UTF-8 day du...
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0push_to_github.ps1"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ======================================================================
    echo [THONG BAO] Tien trinh da ket thuc hoac co loi.
    echo ======================================================================
)

pause
