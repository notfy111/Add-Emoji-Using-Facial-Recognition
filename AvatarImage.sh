#Output file name 
OUTPUT=$1
#School name 
LONGNAME=$2

#NAME=`sed -e 's/$/ /' -e 's/\([^ ]\)[^ ]* /\1/g' -e 's/^ *//'`
NAME=`echo "${LONGNAME}" |sed -e 's/$/ /' -e 's/\([^ ]\)[^ ]* /\1/g' -e 's/^ *//'`
echo "$NAME"
# UPPER= echo $NAME| tr '[:lower:]' '[:upper:]'
# echo "$UPPER"

#Gradient combination array
ARRAYG=("#FAACA8-#DDD6F3" "#D9AFD9-#97D9E1" "#8EC5FC-#E0C3FC" "#FEE140-#FA709A" "#52ACFF-#FFE32C" 
	"#D9AFD9-#97D9E1" "#FAD961-#F76B1C" "#FFDEE9-#B5FFFC" "#FF9A8B-#FF6A88" "#85FFBD-#FFFB7D"
	"#FFDEE9-#B5FFFC" "#FBAB7E-#F7CE68" "#FBAB7E-#F7CE68" "#FBDA61-#FF5ACD" "#F4D03F-#16A085"
	"#21D4FD-#B721FF" "#0093E9-#80D0C7" "#4158D0-#C850C0-#FFCC70" "#3EECAC-#EE74E1" "snow-navy" 
	"gold-firebrick" "yellow-limegreen" "khaki-tomato" "darkcyan-snow" "tomato-steelblue" "red-blue")

INDEX=$((RANDOM %${#ARRAYG[@]}))
BKGRD_C=${ARRAYG["$INDEX"]}

#Font combination array
ARRAYFF=("NotoSans-unhinted/NotoSans-Black.ttf" "NotoSans-unhinted/NotoSans-SemiCondensedBlack.ttf"
	"ayuenda-shadow.otf" "SunsetBoulevard.otf" "Hemondalisa.ttf" "BlackDramaDemo.ttf" "GreatLakesNF.ttf" "S&SNicksonOne.otf"
	"BlacksideBold.otf" "Blackside.otf" "EnoughHollow.ttf" "pepperlandcond.ttf" "pepperlandexbold.ttf" "pepperlandacadital.ttf" "AmericanLabelDMO.ttf"
	"UnicornPop.ttf" "GeckoLunch.ttf" "johnnytorch.ttf" "johnnytorch3d.ttf" "Malvie.otf" "HippieMovement.ttf" "varsity_regular.ttf" "heavyheap.ttf" 
	"Disko.ttf" "CoasterShadow.ttf" "Athletic.TTF" "SoccerLeague.ttf")
INDEX1=$((RANDOM % ${#ARRAYFF[@]}))
FONT=${ARRAYFF["$INDEX1"]}

echo "FONT=$FONT"


#Random rotation angle1
RANDOM_LEVEL1=`jot -r 1 10 70`
IN=$RANDOM_LEVEL1
let IN*=-1
echo "IN=$IN"
#Random rotation angle2
RANDOM_LEVEL2=`jot -r 1 550 650`
OUT=$RANDOM_LEVEL2
echo "OUT=$OUT"

#Fill in combination array
ARRAYFN=("white" "ivory" "beige" "red" "violet" "blue" "green" 
		 "grey" "azure" "coral" "crimson" "gold")
INDEX2=$((RANDOM %${#ARRAYFN[@]}))
FILLIN=${ARRAYFN["$INDEX2"]}
echo "FIllIN=$FILLIN"

convert -size 600x600 -background none gradient:"$BKGRD_C" bkgrd.png
convert -size 400x400 -stroke black -strokewidth 10 -background none -fill "$FILLIN" -font "../assets/fonts/$FONT" -wave "$IN"x"$OUT" caption:"$NAME" label.png
convert  -resize 800x800 -geometry 800x800+80+100 -composite bkgrd.png label.png  "$OUTPUT"

