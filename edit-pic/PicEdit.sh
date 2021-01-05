
#select a file randomly from the photo folder
INFILE=`ls ../assets/background-images/*.png | gshuf -n 1`
OUTPUT=$1
WW=$2
HH=$3
ANGL=$4
ANGH=$5
CHOP=$6
BKGRD=500+"$WW"

# infile="white_cat1.jpg"
# ww=250
# hh=250
# inname=`convert "$infile" -format "%t" info:`
# convert "$infile" -canny 0x1+10%+30% tmp1.gif
# coords=`compare -metric rmse -subimage-search -dissimilarity-threshold 1 tmp1.gif \( -size ${ww}x${hh} xc:white \) null: 2>&1 | cut -d\  -f4`
# xoff=`echo "$coords" | cut -d, -f1`
# yoff=`echo "$coords" | cut -d, -f2`
# convert "$infile" -crop ${ww}x${hh}+${xoff}+${yoff} +repage ${inname}_crop.jpg
#Rotate it 
RANDOM_LEVEL=`jot -r 1 "$ANGL" "$ANGH"`
convert -size 2500x2500  plasma:tomato-steelblue -blur 0x1 step0.png 
#crop it to square  
convert  -crop "$WW"x"$HH"+0+0 -chop 0x"$CHOP" "$INFILE" step1.png
#color shifting (random level)
RANDOM_LEVEL1=`jot -r 1 10 30`
convert -level $RANDOM_LEVEL1% step1.png step2.png
convert -rotate $RANDOM_LEVEL step2.png step22.png 

convert -background green -background none -rotate $RANDOM_LEVEL step2.png step3.png

convert -composite step0.png step3.png step3.png

#resize 3 random emojis
EMOJI1=`ls ../assets/emoji/*.png | gshuf -n 1`
EMOJI2=`ls ../assets/emoji/*.png | gshuf -n 1`
EMOJI3=`ls ../assets/emoji/*.png | gshuf -n 1`
#rotate them at different (random) angle
#convert  -resize 100x100 "$EMOJI1" step5.png
convert -background black -rotate "$RANDOM_LEVEL1"% -bordercolor black -border 1x1 -alpha set -channel RGBA -fuzz 1% -fill none -floodfill +0+0 black -shave 1x1 "$EMOJI1" step4.png
#convert  -resize 100x100 "$EMOJI2" step7.png
convert -background black -rotate "$RANDOM_LEVEL1"% -bordercolor black -border 1x1 -alpha set -channel RGBA -fuzz 1% -fill none -floodfill +0+0 black -shave 1x1  "$EMOJI2" step5.png
#convert  -resize 100x100 "$EMOJI3" step9.png
convert -background black -rotate "$RANDOM_LEVEL1"% -bordercolor black -border 1x1 -alpha set -channel RGBA -fuzz 1% -fill none -floodfill +0+0 black -shave 1x1  "$EMOJI3" step6.png
#composite emojis with the background photo
convert  "$OUTPUT"
  composite -geometry 240x200+700+300 step4.png step3.png step3.png
  composite -geometry 280x250+1100+500 step5.png step3.png step3.png
  composite -geometry 300x260+880+400 step6.png step3.png "$OUTPUT" 

# rm *step*

#rm *step*

#output final photo


# $0 is the script name
# $1 is the first agument
# $2 is second, and so forth
#echo Who are you
#read who
#echo "level is $RANDOM_LEVEL"
#echo Hello, $who!
#print File



