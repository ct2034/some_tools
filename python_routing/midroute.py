import matplotlib.pyplot as plt
import numpy as np
import scipy as sp
# own imports
import helpers

# DATA INPUT
map = sp.misc.imread('map.png')
pstart = [14, 87];
pend = [90, 85];
max_coord = [len(map[:,1,:])-1, len(map[1,:,:])-1];

# ROUTE
route = []
route.append(pstart);
route.append(pend);
arr_route = np.array(route)
arr_obstacles = np.array(helpers.check_line(map, pstart, pend))

print arr_obstacles

for obst in arr_obstacles:
  print helpers.get_midpoint(map, obst, max_coord)

# DISPLAY
fig, axes = plt.subplots(1, 1);
axes.imshow(map);
axes.plot(pstart[0], pstart[1], 'rx');
axes.plot(pend[0], pend[1], 'gx');
axes.plot(arr_route[:,0], arr_route[:,1], 'b-');
#axes.plot(arr_obstacles[:,0], arr_obstacles[:,1], 'bx');

fig.show();
raw_input('Please press enter ... ');



