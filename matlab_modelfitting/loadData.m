fname = '2014-12-21-12-40-46.mat';

disp 'loading ...'
disp(fname)
load(fname)

n = length(current(:,1));
X = zeros(n,6);

y = sum(current(:,2:5)')';
X(:,1:3) = abs(velocity);

acceleration = zeros(n,3);
for i = [2:n]
	acceleration(i,:) = velocity(i,:) - velocity(i-1,:);
end

X(:,4:6) = acceleration;

X = [ones(n,1), X];

disp '...'
disp 'y = current | X = ones / velocity / acceleration'