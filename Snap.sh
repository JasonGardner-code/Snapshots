Certainly! You can also achieve this using a bash script that combines tools like `wget` to download the web pages and `wkhtmltoimage` to convert them to screenshots. Here's a simple example of a bash script that takes screenshots of multiple websites and creates an HTML page to display them:

1. Create a bash script named `website_screenshots.sh`:

```bash
#!/bin/bash

# Define the list of URLs
urls=("https://example.com" "https://google.com")

# Create a directory to store the screenshots
mkdir screenshots

# Loop through each URL and take a screenshot
for i in "${!urls[@]}"; do
    wget -O "page_${i}.html" "${urls[i]}"
    wkhtmltoimage "page_${i}.html" "screenshots/screenshot_${i}.png"
done

# Create an HTML page to display the screenshots
cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Website Screenshots</title>
    <style>
        body {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }
        img {
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
EOF

for i in "${!urls[@]}"; do
    echo "    <img src=\"screenshots/screenshot_${i}.png\" alt=\"Screenshot $((i+1))\">" >> index.html
done

echo "</body></html>" >> index.html

# Clean up temporary files
rm *.html

echo "Screenshots captured successfully. Open index.html to view them."
```

2. Make the script executable:

```bash
chmod +x website_screenshots.sh
```

3. Run the script:

```bash
./website_screenshots.sh
```

This bash script downloads the web pages specified in the `urls` array, converts them to screenshots using `wkhtmltoimage`, and creates an HTML file (`index.html`) to display the screenshots in a grid layout. You
