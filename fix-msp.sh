#!/bin/bash

echo "Searching for MovieStarPlanet applications on your Mac..."

FOUND=false

while IFS= read -r app; do
    if [ -d "$app" ]; then
        echo "Found: $app"
        xattr -cr "$app"
        /usr/libexec/PlistBuddy -c "Set :NSHighResolutionCapable false" "$app/Contents/Info.plist" 2>/dev/null || /usr/libexec/PlistBuddy -c "Add :NSHighResolutionCapable bool false" "$app/Contents/Info.plist"
        touch "$app"
        echo "Success! Low resolution mode enabled and quarantine removed for: $app"
        FOUND=true
    fi
done < <(mdfind "kMDItemContentType == 'com.apple.application-bundle'" | grep -vE "^/(System|Library)/" | grep -iE "/(mspclassic|msp2|moviestarplanet[^/]*)\.app$")

if [ "$FOUND" = false ]; then
    echo "No MovieStarPlanet applications found on your Mac."
else
    echo "All done! Launch your game and enjoy lower CPU usage."
fi
