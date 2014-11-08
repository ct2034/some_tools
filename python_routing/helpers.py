import numpy as np

# Function to check whether a straight line between two points is free
def check_line(map, s, e):
  pixel = [0, 0]
  pixel[0] = s[0]
  pixel[1] = s[1]
  slope = float(float(e[1])-s[1])/(e[0]-s[0])
  line = [float(e[1])-slope*e[0], slope] #line parameters
  dire = [np.sign(e[0]-s[0]), np.sign(e[1]-s[1])] #directions to move in
  obstacles = []
  prevpixel = [0, 0]
        
  while pixel!=e:
    value = (float(pixel[0])+.5*dire[0]) * line[1] + line[0]
    prevpixel[0] = pixel[0]
    prevpixel[1] = pixel[1]
    
    if value > (pixel[1]+.5*dire[1]): #line continues horizontal
      pixel[0]=pixel[0]+dire[0]
    else: #line continues vertical
      pixel[1]=pixel[1]+dire[1]
      
    if map[pixel[1],pixel[0],0] != map[prevpixel[1],prevpixel[0],0]: #an edge
      
      if map[pixel[1],pixel[0],0] == 0: #begin of obstacle
        obststart = [prevpixel[0],prevpixel[1]]
      else: #end of obstacle
        obstacles.append([obststart, [pixel[0],pixel[1]]])
    
  return obstacles
