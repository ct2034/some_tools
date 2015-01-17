fname = '2014-12-21-12-40-46.mat';

disp 'loading ...'
disp(fname)
load(fname)

n = length(current(:,1));
X = zeros(n,6);
X3 = zeros(n,18);

y = sum(current(:,2:5)')';
X(:,1:3) = abs(velocity);
X3(:,1) = X(:,1);
X3(:,2) = X(:,1) .** 2;
X3(:,3) = X(:,1) .** 3;
X3(:,4) = X(:,2);
X3(:,5) = X(:,2) .** 2;
X3(:,6) = X(:,2) .** 3;
X3(:,7) = X(:,3);
X3(:,8) = X(:,3) .** 2;
X3(:,9) = X(:,3) .** 3;

acceleration = zeros(n,3);
for i = [2:n]
	acceleration(i,:) = velocity(i,:) - velocity(i-1,:);
end

X(:,4:6) = acceleration;
X3(:,10) = X(:,4);
X3(:,11) = X(:,4) .** 2;
X3(:,12) = X(:,4) .** 3;
X3(:,13) = X(:,5);
X3(:,14) = X(:,5) .** 2;
X3(:,15) = X(:,5) .** 3;
X3(:,16) = X(:,6);
X3(:,17) = X(:,6) .** 2;
X3(:,18) = X(:,6) .** 3;

X = [ones(n,1), X];
X3 = [ones(n,1), X3];

[X_norm, mu, sigm] = featureNormalize(X);
[X3_norm, mu3, sigm3] = featureNormalize(X3);

disp '...'
disp 'y = current | X = ones / velocity / acceleration'