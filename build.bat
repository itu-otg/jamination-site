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
..\mustache.exe "data.yml" "index_body.html" > ..\%foldername%\index.html
..\mustache.exe "data.yml" "index_style.css" > ..\%foldername%\index\style.css
..\mustache.exe "data.yml" "shared_style.css" > ..\%foldername%\shared\style.css

echo Website built successfully
pause

..\%foldername%\index.html
