% A visualisation of planar velocity efficiency info for mecanum wheeled robots

% VALUES
l = 1.5;  %m  length of the robot (wheel base)
b = 1;    %m  width of the robot (wheel base)

maxm = 1; %   maximal area from centre
res = 100; %   data points per meter

% CALC
wheels = .5 * [[b, -l]; [-b, -l]; [-b, l] ;[b, l]];
%		SE (1)	  SW (2)   NW (3)   NE (4)	

[x,y] = meshgrid(-maxm:2*maxm/res:maxm);
cost = zeros(length(wheels(:,1)), length(x), length(y));
maxi = zeros(length(x), length(y));

for iw = 1:length(wheels(:,1))
  cost(iw,:,:) = abs( sin( atan2(y-wheels(iw,2),x-wheels(iw,1))+((-1)^iw*pi/4) ) );   
end

for ix = 1:length(x)
  for iy = 1:length(y)
    maxi(ix,iy) = max(cost(:,ix,iy));
  end
end 

figure
mesh(x,y,maxi);
hold on
plot3(wheels(:,1), wheels(:,2), ones(length(wheels(:,1)),1),'bx');
name = strcat("plot_", strftime ("%y%m%d_%H%M%S", localtime (time ())), ".png")
print('dpng', name)


