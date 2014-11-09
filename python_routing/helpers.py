import numpy as np

# Function to check whether a straight line between two points is free
def check_line(map, s, e):
  obstacles = []
  [line, dire] = get_line(s, e)
  ls = [0,0]
  [ls[0], ls[1]] = [s[0], s[1]]
  
  edge = [1]
  obststart = []
  
  edge = get_edge(map, line, dire, ls, e)
  while edge != []:
    if map[edge[1][1],edge[1][0],0] == 0: #begin of obstacle
      obststart = [edge[0][0],edge[0][1]]
    else: #end of obstacle
      obstacles.append([obststart, [edge[1][0],edge[1][1]]])
        
    [ls[0], ls[1]] = [edge[1][0], edge[1][1]]
    edge = get_edge(map, line, dire, ls, e)
      
  return obstacles
  
# Function to find the midpoints for a given obstacle
def get_midpoint(map, obs, max_coords):
  middle = [(float(obs[0,0]))+(obs[1,0]-obs[0,0])/2, (float(obs[0,1]))+(obs[1,1]-obs[0,1])/2]
  #print middle
  
  [line, dire] = get_line(obs[0], obs[1])
  
  if line[1] == 0:
    vert_line = [0, float('inf')]
  else:
    vert_slope = 1 / line[1]
    vert_y = float(middle[1])-vert_slope*middle[0]
    vert_line = [vert_y, vert_slope]
  print vert_line
  print line
  
  if dire[0] > 0:
    value = (float(max_coord[0]) * vert_line[1] + vert_line[0]
    if dire[1] > 0:
      if value > max_coord[1]:
        end = [blabla, max_coord[1]]
  
  get_edge(map, vert_line, dire, middle, 
   
  return
  
# Function returns an edge from walking a linear function discretely
def get_edge(map, line, dire, s, e):
  pixel = [0, 0]
  pixel[0] = s[0]
  pixel[1] = s[1]
  
  prevpixel = [0, 0]
        
  while pixel!=e:
    prevpixel[0] = pixel[0]
    prevpixel[1] = pixel[1]
    
    if line[1] == float('inf'): #vertical line
      pixel[1]=pixel[1]+dire[1]
    else:
      value = (float(pixel[0])+.5*dire[0]) * line[1] + line[0]
      
      if value > (pixel[1]+.5*dire[1]): #line continues horizontal
        pixel[0]=pixel[0]+dire[0]
      else: #line continues vertical
        pixel[1]=pixel[1]+dire[1]
      
    if map[pixel[1],pixel[0],0] != map[prevpixel[1],prevpixel[0],0]: #an edge
      return [prevpixel, pixel]
  
  return []
      
# Function to get line parameters and directions from two points
def get_line(s, e):
  if s[0] == e[0]:
    line = [0, float('inf')] #vertical line
  else:
    slope = float(float(e[1])-s[1])/(e[0]-s[0])
    line = [float(e[1])-slope*e[0], slope] #line parameters
  dire = [np.sign(e[0]-s[0]), np.sign(e[1]-s[1])] #directions to move in
  return [line, dire]

  
