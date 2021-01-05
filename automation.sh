
#Reads in school name line by line
while IFS= read -r line; do
    echo "Text read from file: $line"
    S="abcdef"
    #if school name ends with "school"
if [[ "$line" == *ool ]]
then
    echo true
    ./AvatarImage.sh "$line".png "$line"
else
	#add "s" to school  initials that do not end with "school"
	S=" S"
    echo false
    ./AvatarImage.sh "$line".png "$line$S"
fi

done < "$1"