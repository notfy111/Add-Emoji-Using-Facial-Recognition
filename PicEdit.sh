
#select a file randomly from the photo folder
echo "new file"
INFILE=`ls ../assets/background-images/*.png | gshuf -n 1`
#Output file name
OUTPUT=$1
#Width parameter
WW=$2
#Height parameter
HH=$3
#Angle lower bound
ANGL=$4
#Angle upper bound
ANGH=$5
#chop parameter
CHOP=$6


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
convert -background black -rotate $RANDOM_LEVEL "$INFILE" step1.png 
# INNAME=`convert "$INFILE" -format "%t" info:`
# convert "$INFILE" -canny 0x1+10%+30% tmp1.gif
# echo "ok"
# COORDS=`compare -metric rmse -subimage-search -dissimilarity-threshold 1 tmp1.gif \( -size ${WW}x${HH} \) null: 2>&1 | cut -d\  -f4`
# echo "ok"
# # XOFF=`echo "$COORDS" | cut -d, -f1`
# # YOFF=`echo "$COORDs" | cut -d, -f2`
# echo "ok"
# convert -crop ${WW}x${HH}+0+0  "$INFILE" step1.png

#crop it to square  
convert  -crop "$WW"x"$HH"+0+0 -chop 0x"$CHOP" step1.png step2.png
#color shifting (random level)
RANDOM_LEVEL1=`jot -r 1 10 30`
convert -level $RANDOM_LEVEL1% step2.png step3.png
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
  composite -geometry 70x80+500+80 step4.png step3.png step3.png
  composite -geometry      +100+30 step5.png step3.png step3.png
  composite -geometry 140x160+350+20 step6.png step3.png "$OUTPUT" 

# rm *step*

rm *step*
  convert -caption "Heyyy" -pointsize 50 "$OUTPUT" -gravity center \
           -background black +polaroid "$OUTPUT"
  OUTPUT=`ls>> /output-image`

#output final photo


# $0 is the script name
# $1 is the first agument
# $2 is second, and so forth
#echo Who are you
#read who
#echo "level is $RANDOM_LEVEL"
#echo Hello, $who!
#print File



