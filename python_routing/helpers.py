# Function to check whether a straight line between two points is free
def check_line(map, s, e):
  pixel = s
  slope = (e[1]-s[1])/(e[0]-s[0])
  line = [e[1]-slope*e[0], slope]
  while pixel!=e:
    if map[pixel[0],pixel[1],0] > 0:
      return 0
    else:
      return 1
