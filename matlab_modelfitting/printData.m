disp 'print ..'

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

for f = [1:6]
	subplot(3,2,f)
	
	% data
	x = X3(:,2+(f-1)*3);
	plot(x, y, 'bx');
	hold on

	% linear
	xax = [min(x):max(x)];
	liney_norm = 0;
	liney_norm = polyval([theta(f+1), theta(1)], xax);
	liney = 0;
	liney = normalize(liney_norm', mu(f+1), sigm(f+1)) + mu(1);
	plot(xax, liney, 'r-');

	% 3 poly
	liney_norm3 = 0;
	liney_norm3 = polyval([theta3(4+(f-1)*3), theta3(3+(f-1)*3), theta3(2+(f-1)*3), theta3(1)], xax);
	liney3 = 0;
	liney3 = normalize(liney_norm', mu3(f+3), sigm3(f+3)) + mu(1);
	plot(xax, liney3, 'k-');

	%annotations
	switch (f)
		case 1
			title('v_x');
		case 2
			title('v_y');
		case 3
			title('v_{th}');
		case 4
			title('a_x');
		case 5
			title('a_y');
		case 6
			title('a_{th}');
	end

	legend(['data'; 'linear model'; '3 poly model'])
end

