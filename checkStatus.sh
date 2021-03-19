rm $2/$3
for file in ./"$2"/*
do
	"$1" "$file";
	if [ "$?" -eq 0 ]; 
	then
		echo "$?" >> "$3";
	else
		output=$( "$1" "$file" 2>&1)
		echo "$output" >> "$3";
	fi
done
