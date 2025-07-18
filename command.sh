#!/bin/bash
html_pdf() {
    local input="$1"
    local output="${2:-$(basename "${input%.*}").pdf}"
    local browser=$(command -v chromium-browser || command -v google-chrome)
    
    [[ -z "$input" ]] && { echo "Usage: html_pdf <url_or_html_file> [output.pdf]"; return 1; }
    [[ -z "$browser" ]] && { echo "Missing chromium-browser or google-chrome"; return 1; }
    
    "$browser" --headless --disable-gpu --print-to-pdf="$output" "$input" 2>/dev/null && echo "File saved as $output" || { echo "Conversion failed"; return 1; }
}