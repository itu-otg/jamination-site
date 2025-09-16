@echo off
set /p foldername=Enter the output folder name: 

:: Create the folder
mkdir "%foldername%"
echo Folder "%foldername%" has been created.

:: --------------------------------
::     TEMPLATE BUILD SECTION
:: --------------------------------

:BUILD_WEBSITE

xcopy ".\assets\*" "%foldername%\" /E /I /Y

cd templates
..\mustache.exe "data.yml" "shared_style.css" > ..\%foldername%\shared\style.css
..\mustache.exe "data.yml" "index_body.html" > ..\%foldername%\index.html
..\mustache.exe "data.yml" "index_style.css" > ..\%foldername%\index\style.css
..\mustache.exe "data.yml" "faq_body.html" > ..\%foldername%\faq\index.html
..\mustache.exe "data.yml" "faq_style.css" > ..\%foldername%\faq\style.css
..\mustache.exe "data.yml" "sponsors_body.html" > ..\%foldername%\sponsors\index.html
..\mustache.exe "data.yml" "sponsors_style.css" > ..\%foldername%\sponsors\style.css

echo Website built successfully!

:: Start Python in the background
cd ..\%foldername%
start "" /b python -m http.server 8080

echo.
echo Press any key to stop the server...
pause >nul

:: Kill the Python server
taskkill /f /im python.exe

:: When you press Ctrl+C, python quits, and page rebuilds itself
echo Server stopped. Rebuilding...
cd ..
goto BUILD_WEBSITE