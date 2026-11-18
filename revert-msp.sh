#!/bin/bash

echo "Searching for MovieStarPlanet applications on your Mac..."

FOUND=false

while IFS= read -r app; do
    if [ -d "$app" ]; then
        echo "Found: $app"
        /usr/libexec/PlistBuddy -c "Set :NSHighResolutionCapable true" "$app/Contents/Info.plist" 2>/dev/null
        touch "$app"
        echo "Reverted! Retina scaling restored for: $app"
        FOUND=true
    fi
done < <(mdfind "kMDItemContentType == 'com.apple.application-bundle'" | grep -vE "^/(System|Library)/" | grep -iE "/(mspclassic|msp2|moviestarplanet[^/]*)\.app$")

if [ "$FOUND" = false ]; then
    echo "No MovieStarPlanet applications found on your Mac."
else
    echo "All done! Launch your game to enjoy original Retina quality."
fi
