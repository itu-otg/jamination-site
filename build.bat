@echo off
set /p foldername=Enter the output folder name: 

:: Create the folder
mkdir "%foldername%"
echo Folder "%foldername%" has been created.

:: --------------------------------
::     TEMPLATE BUILD SECTION
:: --------------------------------

xcopy ".\assets\*" "%foldername%\" /E /I /Y

cd templates
..\mustache.exe "blank.yml" "index_body.html" > ..\%foldername%\index.html

echo Website built successfully
pause
