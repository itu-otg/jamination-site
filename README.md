# Jamination Site

This repository contains the source code and the templates for the Jamination 8 website.

## Project Structure

- `assets/` - Static assets such as images, scripts, and shared resources.
- `docs/` - Generated site files, including HTML, CSS, and images for deployment.
- `templates/` - Mustache templates and data files used to generate the site.
- `build.bat` - Batch script to build the site.
- `mustache.exe` - Mustache template engine executable. This project uses the Go binding from [cbroglie/mustache](https://github.com/cbroglie/mustache).

## How to Build

1. Ensure `mustache.exe` is available in the project root.
2. Ensure you have `python` and `http.server` installed in your machine to serve the site locally.
3. Run `build.bat` to generate the site and serve it on `localhost:8080`.
4. Pressing any key during this process will kill it and rebuild the site.
5. Entering "docs" as the folder name will generate the files for github pages and won't serve it on localhost.

## Customization

- Edit templates in the `templates/` folder to change the site layout or styles.
- Update `templates/data.yml` for site-wide data changes.
- Place new images or scripts in the appropriate `assets/` subfolders.
- Edit the `build.bat` accordingly to render and save the templates

## Deployment

The generated site can be deployed to any static web host (e.g., GitHub Pages).
