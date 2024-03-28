#!/bin/bash

# Create a new HTML file
echo "<html><body>" > subdomains.html

# Loop through each subdomain in the text file
while IFS= read -r subdomain; do
    # Use wget to capture a screenshot of the front page of each subdomain
    wget -q "http://$subdomain" -O "$subdomain.png"
    
    # Add the screenshot to the HTML file
    echo "<h2>$subdomain</h2>" >> subdomains.html
    echo "<img src='$subdomain.png'>" >> subdomains.html

    # Remove the screenshot file
    rm "$subdomain.png"
done < subdomains.txt

# Close the HTML file
echo "</body></html>" >> subdomains.html

echo "Snapshot of each subdomain's front page created in subdomains.html"
