disp 'print ..'
close all

%% show the data
% ---------------------------------------------------------------------
figure
subplot(2,1,1)
plot(time, current)
legend(['main'; 'motor1'; 'motor2'; 'motor3'; 'motor4'])
title('Currents')

subplot(2,1,2)
plot(time, velocity);
legend(['v_x'; 'v_y'; 'v_{th}'])
title('Velocitys')

%% show model
% ---------------------------------------------------------------------
figure

subplot(3,2,1) % v_x
x = X(:,2);
plot(x, y, 'bx');
xax = [min(x):max(x)];
hold on
plot(xax, polyval([theta(2), theta(1)], xax), 'r-');
ylabel('v_x')

subplot(3,2,3) % v_y
x = X(:,3);
plot(x, y, 'bx');
xax = [min(x):max(x)];
hold on
plot(xax, polyval([theta(3), theta(1)], xax), 'r-');
ylabel('v_y')

subplot(3,2,5) % v_th
x = X(:,4);
plot(x, y, 'bx');
xax = [min(x):max(x)];
hold on
plot(xax, polyval([theta(4), theta(1)], xax), 'r-');
ylabel('v_{th}')

subplot(3,2,2) % a_x
x = X(:,5);
plot(x, y, 'bx');
xax = [min(x):max(x)];
hold on
plot(xax, polyval([theta(5), theta(1)], xax), 'r-');
ylabel('a_x')

subplot(3,2,4) % a_y
x = X(:,6);
plot(x, y, 'bx');
xax = [min(x):max(x)];
hold on
plot(xax, polyval([theta(6), theta(1)], xax), 'r-');
ylabel('a_y')

subplot(3,2,6) % a_th
x = X(:,7);
plot(x, y, 'bx');
xax = [min(x):max(x)];
hold on
plot(xax, polyval([theta(7), theta(1)], xax), 'r-');
ylabel('a_{th}')