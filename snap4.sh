#!/bin/bash

# Create a new HTML file
echo "<html><body>" > subdomains.html

# Function to capture a screenshot of a subdomain
capture_screenshot() {
    subdomain=$1
    wget -q "http://$subdomain" -O "$subdomain.png"
    echo "<h2>$subdomain</h2>" >> subdomains.html
    echo "<img src='$subdomain.png'>" >> subdomains.html
    rm "$subdomain.png"
}

# Export the function to be used by parallel
export -f capture_screenshot

# Loop through each subdomain in the text file and run wget commands in parallel
cat subdomains.txt | xargs -n 1 -P 20 -I{} bash -c "capture_screenshot {}"

# Close the HTML file
echo "</body></html>" >> subdomains.html

echo "Snapshot of each subdomain's front page created in subdomains.html"
