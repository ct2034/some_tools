% p3 = polyfit(x, y', 3);
% p1 = polyfit(x, y', 1);

theta = zeros(size(X, 2), 1);

num_iters = 100;
alpha = .001;
lambda = .1;

[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)

% [J, grad] = costFunctionReg(theta, X, y, lambda)

% for it = [1:num_iters]
% 	[J, grad] = costFunctionReg(theta, X, y, lambda);
% 	theta = theta - grad .* alpha;
% 	J_history(it, :) = [J, mean(theta), mean(grad)];
% end

plot(J_history);
% legend(['cost'; 'theta'; 'grad'])