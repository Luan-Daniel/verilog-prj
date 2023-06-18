@echo off

if "%~1"=="" (
	echo Error: expected a directory path as argument
	exit /b 1
)

set "newdir=%~1"
mkdir "%newdir%\src"
mkdir "%newdir%\prj"
mkdir "%newdir%\sim"
mkdir "%newdir%\doc"