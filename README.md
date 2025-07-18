# html_pdf_cli
Bash command to convert url or html file to pdf

## Installation

Add this to your bashrc file : 
```bash
html_pdf() {
    local input="$1"
    local output="${2:-$(basename "${input%.*}").pdf}"
    local browser=$(command -v chromium-browser || command -v google-chrome)
    
    [[ -z "$input" ]] && { echo "Usage: html_pdf <url_or_html_file> [output.pdf]"; return 1; }
    [[ -z "$browser" ]] && { echo "Missing chromium-browser or google-chrome"; return 1; }
    
    "$browser" --headless --disable-gpu --print-to-pdf="$output" "$input" 2>/dev/null && echo "File saved as $output" || { echo "Conversion failed"; return 1; }
}
```
And then, 
```bash
source ~/.bashrc
```

## Usage
Usage : 
```bash
html_pdf example.html
# File saved as example.pdf
html_pdf example.html ./output/filename.pdf
# File saved as ./output/filename.pdf
html_pdf https://example.com
# File saved as example.pdf
```

