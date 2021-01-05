# PicEdit.sh
Takes in a picture from the background-images folder and make modification.

+ Random rotation is realized by randomly selecting a number within the bound given by two arguments: Angle Low and Angle High.


Run the following commands:

```./PicEdit.sh [whatever.png] [Width] [Height] [Angle Low] [Angle high] [Chop]```

Example:

```./PicEdit.sh out.png 2200 2200 10 20 10```


__FaceRec code is not used in this version, so the positon of emoji will not be accurate; have to mannutally modify code to find face coordinates.__

**Optimal range:**

    * Width & Height: 2200-2800
    
    * lowerboundAngle: 5-10 
    
    * upperboundAngle: 15-20
    
    * scopetoChop:10-15
    
