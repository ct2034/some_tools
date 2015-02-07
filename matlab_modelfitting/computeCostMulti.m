function J = computeCostMulti(X, y, theta)
	m = length(y); 

	distances = X * theta - y;

	J = sum(distances .^ 2) / (2 * m);

end
