TIME=200
while [ $TIME -gt 100 ];
# orchestrator
do 
OUTPUT="$TIME.png"
WW=$1
ANGL=$2
ANGH=$3


# INFILE=$7
# XX=$8
# YY=$9
# HH=$10
TEMP_FILE="facelocation.txt"

# run python script
python FaceRec.py 
# import variables
# sets: INFILE XX YY HH
source $TEMP_FILE
# INFILE="$INFILE"
# XX="$XX"
# YY="$YY"
# LL="$LL"
echo "XX=$XX\nYY=$YY\nLL=$LL"
echo "INFILE=$INFILE"
echo "OUTPUT=$OUTPUT"
# Run PicEdit
# Arguments:
# OUTPUT - the output image
# WW - output width
# HH - output height
# ANGL
# ANGH
# CHOP
# INFILE
# XX
# YY
# LL
#call "./PicEdit.sh  WW ANGL ANGH $INFILE $XX $YY $LL  out.png"
./PicEdit.sh  "$1" "$2" "$3"  "$INFILE" "$XX"  "$YY" "$LL" "$OUTPUT"

let TIME-=1

done

echo "All done"
#rm $TEMP_FILE