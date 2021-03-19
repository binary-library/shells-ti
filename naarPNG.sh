#get all jpgs and resize the original file to target 128x128
find $1 -type f -iname '*.jpg' -exec convert '{}' -resize 128x128^ '{}' \;
#get all jpgs and convert to png
find $1 -type f -iname '*.jpg' -exec mogrify -format png '{}' \;
#get all jpgs and remove them
find $1 -type f -iname '*.jpg' -exec rm '{}' \;
