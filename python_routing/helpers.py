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
def get_midpoint(map, obs, max_coord):
  middle = [(float(obs[0][0]))+(obs[1][0]-obs[0][0])/2, (float(obs[0][1]))+(obs[1][1]-obs[0][1])/2]
  
  [line, dire] = get_line(obs[0], obs[1])
  
  if line[1] == 0:
    vert_line = [0, float('inf')]
  else:
    vert_slope = 1 / line[1]
    vert_y = float(middle[1])-vert_slope*middle[0]
    vert_line = [vert_y, vert_slope]
  
  val_right = float(max_coord[0]) * vert_line[1] + vert_line[0] 
  val_left = float(vert_line[0])
  
  if vert_line[1] == float('inf'):
    end1 = [int(middle[0]), max_coord[1]]
    end2 = [int(middle[0]), 0]
    dire1 = [1, 1]
    dire2 = [1, -1]
  
  elif vert_line[1] < 0: # line: \ 
    # RIGHT CASE
    if val_right > 0: # right border
      end1 = [max_coord[0], int(val_right)]
    else: # bottom
      end1 = [int((-vert_line[0])/vert_line[1]), 0]
    dire1 = [1, -1]   
    # LEFT CASE
    if val_left > max_coord[1]: # top border
      end2 = [int(max_coord[1]-vert_line[0]/vert_line[1]), 0]
    else: # left border
      end2 = [0, int(val_left)]
    dire2 = [-1, 1]      
    
  else: # line: /
    # RIGHT CASE
    if val_right < max_coord[1]: # right border
      end1 = [max_coord[0], int(val_right)]
    else: # top border
      end1 = [int((max_coord[1]-vert_line[0])/vert_line[1]), max_coord[1]]  
    dire1 = [1, 1]  
    # LEFT CASE
    if val_left > 0: # left border
      end2 = [0, int(val_left)]
    else: # bottom border
      end2 = [int(-vert_line[0]/vert_line[1]), 0] 
    dire2 = [-1, -1]   
    
  #print [end1, end2]  
  #print [dire1, dire2]     
              
  edges = []            
  temp_edge1 = get_edge(map, vert_line, dire1, middle, end1)
  if temp_edge1 != []:
    edges.append(temp_edge1[1])
  temp_edge2 = get_edge(map, vert_line, dire2, middle, end2)
  if temp_edge2 != []:
    edges.append(temp_edge2[1])
    
  return edges    
  
# Function returns an edge from walking a linear function discretely
def get_edge(map, line, dire, s, e):
  pixel = [0, 0]
  pixel[0] = s[0]
  pixel[1] = s[1]
  
  prevpixel = [0, 0]
  prevpixel[0] = pixel[0]
  prevpixel[1] = pixel[1]
        
  while pixel!=e:
    #print pixel
  
    if map[pixel[1],pixel[0],0] != map[prevpixel[1],prevpixel[0],0]: #an edge
      return [prevpixel, pixel]
  
    prevpixel[0] = pixel[0]
    prevpixel[1] = pixel[1]
   
    if line[1] == float('inf'): #vertical line
      pixel[1]=pixel[1]+dire[1]
    else:
      value = (float(pixel[0])+.5*dire[0]) * float(line[1]) + float(line[0])
      
      if ((value - (pixel[1]+(.5*dire[1]))) ) > 0: #line continues horizontal
        pixel[0]=pixel[0]+dire[0]
      else: #line continues vertical
        pixel[1]=pixel[1]+dire[1]
  
  return []
      
# Function to get line parameters and directions from two points
def get_line(s, e):
  if s[0] == e[0]:
    line = [0., float('inf')] #vertical line
  else:
    slope = float(float(e[1])-s[1])/float(e[0]-s[0])
    line = [float(e[1])-slope*float(e[0]), float(slope)] #line parameters
  dire = [np.sign(e[0]-s[0]), np.sign(e[1]-s[1])] #directions to move in
  return [line, dire]

  
