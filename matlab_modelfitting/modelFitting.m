% p3 = polyfit(x, y', 3);
% p1 = polyfit(x, y', 1);

theta = zeros(size(X, 2), 1);

%% linear model
% ---------------------------------------------------------------------
num_iters = 2000;
alpha = .003;

[theta, J_history] = gradientDescentMulti(X_norm, y, theta, alpha, num_iters);

figure
plot(J_history);
hold on;

%% 3 poly model
% ---------------------------------------------------------------------
theta3 = zeros(size(X3, 2), 1);

num_iters = 10000;
alpha = .01;

[theta3, J_history3] = gradientDescentMulti(X3_norm, y, theta3, alpha, num_iters);

plot(J_history3, 'r');
legend(['linear model learning curve'; '3 poly model learning curve'])
