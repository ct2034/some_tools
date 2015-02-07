function [dat] = applyControlRule(velocity)

	l1 = .3; %m
	l2 = .4; %m
	rule = [ 1  1  -(l1+l2);
			 1 -1    l1+l2;
			 1 -1  -(l1+l2);
			 1  1    l1+l2];

	dat = (rule * velocity(:,1:3)')';

end