# FaceRec.py
Drawing a rectangle around the human face in a picture, writing to a file that documents the coordinate of the rectangle

Tutorial: https://www.superdatascience.com/blogs/opencv-face-detection

Run ``` python FaceRec.py ```

# Orchestrator.sh
Creating a bulk of picture by drawing from the files in _assets/background-images_ and _assets/emoji_

Run```./orchestrator [output/image/name.png] [output width/height] [rotation lowerbound] [rotation upperbound] ```
   
Example:
   
   ``` ./orchestrator.sh out.png 2300 10 20 ```

# facelocation.txt
A file that temporarily stores the coordinates of the face on the input pictures obtained from ```FaceRec.py```.

```Orchestrator.sh``` reads from this file and puts 3 emojis at the corresponding location.
