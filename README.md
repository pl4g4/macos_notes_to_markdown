# Notes Exporter and HTML Cleaner

This repository contains two scripts:

1. **AppleScript** (`export_notes.applescript`): Exports notes from macOS Notes app to Markdown files.
2. **Bash Script** (`remove_html_tags.sh`): Removes all HTML tags from Markdown files in a specified folder.

## Instructions

### 1. Export Notes from macOS Notes

- Download and open `export_notes.applescript` in **Script Editor** on macOS.
- Run the script, and select a folder where the notes will be saved as `.md` files.

### 2. Clean HTML Tags from Markdown Files

- After exporting the notes, open a terminal and run the following command to remove HTML tags from `.md` files:
  ```sh
  find /path/to/folder -type f -name "*.md" -exec sed -i '' 's/<[^>]*>//g' {} +
