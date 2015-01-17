disp 'print ..'
close all

subplot (2,1,1)
plot(y, X(:,2), 'x')
ylabel('Velocity')
subplot (2,1,2)
plot(y, X(:,5), 'x')
ylabel('Acceleration')

figure
hold off
plot(x,y)

hold on
plot(xax, polyval(p1, xax), 'r')
plot(xax, polyval(p3, xax), 'g')

figure
plot(time, current)
legend(['main'; 'motor1'; 'motor2'; 'motor3'; 'motor4'])
title('Currents')

figure
plot(time, velocity, '- -')
legend(['v_x'; 'v_y'; 'v_{th}'])
title('Velocitys')