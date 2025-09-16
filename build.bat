@echo off
set /p foldername=Enter the output folder name (docs for GitHub Pages): 

:: Create the folder
mkdir "%foldername%"
echo Folder "%foldername%" has been created.

:: --------------------------------
::     TEMPLATE BUILD SECTION
:: --------------------------------

:BUILD_WEBSITE

(
    type "templates\data.yml"
    echo.
    if %foldername%==docs (
        echo base_url: "<base href=\"/jamination-site\">"
    ) else (
        echo base_url: "<base href=\"/\">"
    )
) > "templates\tmp_data.yml"

xcopy ".\assets\*" "%foldername%\" /E /I /Y

cd templates
..\mustache.exe "tmp_data.yml" "shared_style.css" > ..\%foldername%\shared\style.css
..\mustache.exe "tmp_data.yml" "index_body.html" > ..\%foldername%\index.html
..\mustache.exe "tmp_data.yml" "index_style.css" > ..\%foldername%\index\style.css
..\mustache.exe "tmp_data.yml" "faq_body.html" > ..\%foldername%\faq\index.html
..\mustache.exe "tmp_data.yml" "faq_style.css" > ..\%foldername%\faq\style.css
..\mustache.exe "tmp_data.yml" "sponsors_body.html" > ..\%foldername%\sponsors\index.html
..\mustache.exe "tmp_data.yml" "sponsors_style.css" > ..\%foldername%\sponsors\style.css

del "tmp_data.yml"

echo Website built successfully!

if %foldername%==docs (
    pause
    exit
)

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