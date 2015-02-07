% p3 = polyfit(x, y', 3);
% p1 = polyfit(x, y', 1);

theta = zeros(size(X, 2), 1);

%% linear model
% ---------------------------------------------------------------------
num_iters = 5000;
alpha = .01;

if y4
	theta = zeros(size(X, 2), 4) .+ mean(mean(abs(X_norm))) / size(X, 2);

	for i = [1:4]
		[theta(:,i), J_history(:,i)] = gradientDescentMulti(X_norm, y(:,i), theta(:,i), alpha, num_iters);
	end
else
	[theta, J_history] = gradientDescentMulti(X_norm, y, theta, alpha, num_iters);
end

figure
plot(J_history);
hold on;
ypos =  max(min(J_history)) + (max(max(J_history)) - min(min(J_history))) * .05;
text(.75*num_iters, ypos, sprintf('min: %.4f', max(min(J_history))));

%% 3 poly model
% ---------------------------------------------------------------------
if poly3
	theta3 = zeros(size(X3, 2), 1);

	num_iters = 10000;
	alpha = .01;

	[theta3, J_history3] = gradientDescentMulti(X3_norm, y, theta3, alpha, num_iters);

	plot(J_history3, 'r');
	legend(['linear model learning curve'; '3 poly model learning curve'])
end	

CH_save_plot 
