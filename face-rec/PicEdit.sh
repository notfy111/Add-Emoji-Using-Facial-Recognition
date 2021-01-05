
WW=$1
ANGL=$2
ANGH=$3
INFILE=$4
XX=$5
YY=$6
LL=$7
OUTPUT=$8
BKGRDSIZE="$WW"


echo "WW=$WW"
echo "ANGL=$ANGL"
echo "ANGH=$ANGH"
echo "INFILE=$INFILE"
echo "XX=$XX"
echo "YY=$YY"
echo "LL=$LL"
echo "second time: OUTPUT=$OUTPUT"

#face upper-left corner coordinate
FACEXP="$XX"
FACEXM="$XX"
let FACEXP+=400
let FACEXM-=400
#face upper-right corner coordinate
FACEYP="$YY"
FACEYM="$YY"
let FACEYP+=400
let FACEYM-=400

#both positive and negative angle range
NEGH="$ANGL"
let NEGH*=-1
NEGL="$ANGH"
let NEGL*=-1
#randomly select from the posivive range
RANDOM_LEVEL=`jot -r 1 "$ANGL" "$ANGH"`
echo "RANDOM_LEVEL=$RANDOM_LEVEL"
#randomly select from the negative range
RANDOM_LEVEL0=`jot -r 1 "$NEGL" "$NEGH"`
echo "RANDOM_LEVEL0=$RANDOM_LEVEL0"
#array to store the two random values
ARRAYD=($RANDOM_LEVEL $RANDOM_LEVEL0)
PICK=$((RANDOM % 2 ))
#pick either the negative or positive value
DEGREE=${ARRAYD[$PICK]}
echo "DEGREE=$DEGREE"


#another random seed
RANDOM_LEVEL1=`jot -r 1 10 30`

# 3 random emojis
EMOJI1=`ls ../assets/emoji/*.png | gshuf -n 1`
EMOJI2=`ls ../assets/emoji/*.png | gshuf -n 1`
EMOJI3=`ls ../assets/emoji/*.png | gshuf -n 1`

#array of gradient combination
ARRAYG=("#FAACA8-#DDD6F3" "#D9AFD9-#97D9E1" "#8EC5FC-#E0C3FC" "#FEE140-#FA709A" "#52ACFF-#FFE32C" "#D9AFD9-#97D9E1" "#FAD961-#F76B1C" "#FFDEE9-#B5FFFC" "#FF9A8B-#FF6A88" "#85FFBD-#FFFB7D" "#FFDEE9-#B5FFFC" "#FBAB7E-#F7CE68")
INDEX=$((RANDOM % 11 ))
BKGRD_C=${ARRAYG["$INDEX"]}

#convert emoji
#echo -e "${RED}Rotating EMOJI1 and saving to step1.png${NC}"
convert -background black -rotate "$RANDOM_LEVEL1"% -bordercolor black -border 1x1 -alpha set -channel RGBA -fuzz 1% -fill none -floodfill +0+0 black -shave 1x1 "$EMOJI1" step1.png
#convert  -resize 100x100 "$EMOJI2" step7.png
#echo -e "${RED}Rotating EMOJI2 and saving to step2.png${NC}"
convert -background black -rotate "$RANDOM_LEVEL1"% -bordercolor black -border 1x1 -alpha set -channel RGBA -fuzz 1% -fill none -floodfill +0+0 black -shave 1x1  "$EMOJI2" step2.png
#convert  -resize 100x100 "$EMOJI3" step9.png
#echo -e "${RED}Rotating EMOJI3 and saving to step3.png${NC}"
convert -background black -rotate "$RANDOM_LEVEL1"% -bordercolor black -border 1x1 -alpha set -channel RGBA -fuzz 1% -fill none -floodfill +0+0 black -shave 1x1  "$EMOJI3" step3.png
#adjust color level
convert -level "$RANDOM_LEVEL1%" "${INFILE}" step4.png



#composite emojis to picture
convert  step4.png
   composite -geometry 500x270+"$FACEXM"+"$YY" step1.png step4.png step4.png
   composite -geometry 300x280+"$XX"+"$FACEYM" step2.png step4.png step4.png
   composite -geometry 290x330+"$FACEXP"+"$YY" step3.png step4.png step4.png

#add gradient background
let BKGRDSIZE+=500
convert -size "$BKGRDSIZE"x"$BKGRDSIZE"  gradient:"$BKGRD_C" -blur 0x1 step5.png 

#crop and rotate
convert   -crop "$WW"x"$WW"+0+0  -rotate "$DEGREE"% -background none step4.png step6.png

convert -composite step5.png step6.png "$OUTPUT"

rm *step*




