# Jamination Site

This repository contains the source code and templates for the Jamination website.

## Project Structure

- `assets/` - Static assets such as images, scripts, and shared resources.
- `docs/` - Generated site files, including HTML, CSS, and images for deployment.
- `templates/` - Mustache templates and data files used to generate the site.
- `build.bat` - Batch script to build the site.
- `mustache.exe` - Mustache template engine executable. This project uses the Go binding from [cbroglie/mustache](https://github.com/cbroglie/mustache).

## How to Build

1. Ensure `mustache.exe` is available in the project root.
2. Run `build.bat` to generate the site in the `docs/` directory.

## Customization

- Edit templates in the `templates/` folder to change the site layout or styles.
- Update `templates/data.yml` for site-wide data changes.
- Place new images or scripts in the appropriate `assets/` subfolders.
- Edit the `build.bat` accordingly to render and save the templates

## Deployment

The generated site in `docs/` can be deployed to any static web host (e.g., GitHub Pages).
