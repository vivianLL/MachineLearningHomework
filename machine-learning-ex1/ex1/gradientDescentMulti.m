function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

%===MY CODE===
feature_number = size(X,2);
temp = zeros(feature_number,1);
%==============

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
%    for i = 1:feature_number
%        temp(i) = theta(i) - (alpha/m) * sum((X*theta - y).* X(:,i)); 
%    end
%    for j = 1:feature_number
%       theta(i) = temp(j);
%    end

    theta = theta - X'*(X*theta-y)/m*alpha;









    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
