% fname = '2014-12-21-12-40-46.mat';
% fname = '2014-12-21-12-34-28.mat';
fname = '2014-12-21-12-26-22.mat';

disp 'loading ...'
disp(fname)
load(fname)

n = length(current(:,1));

y = sum(current(:,2:5)')';
if y4
	y = current(:,2:5);
end

clear X;
X(:,1:3) = velocity;

if con_rule
	X = [X, applyControlRule(velocity)];
end

m = size(X, 2);
acceleration = zeros(n,m);
for i = [2:n]
	acceleration(i,:) = X(i,:) - X(i-1,:);
end

X = [X, abs(acceleration)];

if y4
	X = [abs(X(:,1:7)), X(:,8:14)]; 
else
	X = [abs(X(:,1:3)), X(:,4:6)]; 
end

[X_norm, mu, sigm] = featureNormalize(X);

if poly3
	X3 = zeros(n,18);

	X3(:,1) = X(:,2);
	X3(:,2) = X(:,2) .** 2;
	X3(:,3) = X(:,2) .** 3;
	X3(:,4) = X(:,3);
	X3(:,5) = X(:,3) .** 2;
	X3(:,6) = X(:,3) .** 3;
	X3(:,7) = X(:,4);
	X3(:,8) = X(:,4) .** 2;
	X3(:,9) = X(:,4) .** 3;

	X3(:,10) = X(:,5);
	X3(:,11) = X(:,5) .** 2;
	X3(:,12) = X(:,5) .** 3;
	X3(:,13) = X(:,6);
	X3(:,14) = X(:,6) .** 2;
	X3(:,15) = X(:,6) .** 3;
	X3(:,16) = X(:,7);
	X3(:,17) = X(:,7) .** 2;
	X3(:,18) = X(:,7) .** 3;

	X3 = [ones(n,1), X3];

	[X3_norm, mu3, sigm3] = featureNormalize(X3);
end

X = [ones(n,1), X];
X_norm = [ones(n,1), X_norm];

disp '...'
disp 'y = current | X = ones / velocity / acceleration'