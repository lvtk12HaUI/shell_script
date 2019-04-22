#!/bin/bash
#Delete excess files and excess folders 
ls -d */ | while read dir; do #ls -d */ : chi liet ke folder 
    if [ -d "$dir" ]; then    # [ -d "$dir" ] : kiem tra file neu la 1 thu muc
        rm -rf "$dir"
    fi
done

DayOfWeek=$(date +"%u")  

for (( i=1; i<=7; i++ ))
do 
    # Get day of the week
    # Variable $Distance Is distance from the current day
    Distance=`expr "$i" - "$DayOfWeek"`
    GetDay=$(date -d "$Distance day" +%d_%m_%Y)

    # Get idol name by the line number in file idol.txt 
    GetKeyWord=$(sed -n $i'p' < idol.txt) 

    GetImageLink=$(wget --user-agent 'Mozilla/5.0' -qO - "https://www.google.com/search?q=$GetKeyWord\&tbm=isch" | sed 's/</\n</g' | grep '<img' | tail -1 | sed 's/.*src="\([^"]*\)".*/\1/')

    # create folder and download image
    mkdir $GetDay
    wget "$GetImageLink" -O "$GetDay/$GetKeyWord.jpg"
done