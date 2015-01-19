function [X_den] = deNormalize(X, mu, sigma)

X_den = X;
  
	for i = 1:size(X, 2)
		if sigma(i) == 0
			X_den(:,i) = X(:,i) + mu(i);
		else	
			X_den(:,i) = X(:,i) * sigma(i) + mu(i);
		end
	end

end
