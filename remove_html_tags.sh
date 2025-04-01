find /path/to/folder -type f -name "*.md" -exec sed -i '' 's/<[^>]*>//g' {} +
