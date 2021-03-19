mkdir $1/Afbeeldingen;
find $1 -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.png' \) -exec mv '{}' $1/Afbeeldingen/ \;
