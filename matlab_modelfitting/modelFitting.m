% p3 = polyfit(x, y', 3);
% p1 = polyfit(x, y', 1);

theta = zeros(size(X, 2), 1);

num_iters = 500;
alpha = .001;
lambda = .1;

[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

figure
plot(J_history);
