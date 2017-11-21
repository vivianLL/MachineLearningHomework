function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
% Implement of forward propogation
X = [ones(m, 1), X];
Layer_Hidden1 = X * Theta1';
Layer_Hidden2 = sigmoid(Layer_Hidden1);
Layer_Hidden3 = [ones(m, 1), Layer_Hidden2];
Layer_Output = sigmoid(Layer_Hidden3 * Theta2');

for i = 1:m
    % Recall that the cost function for the neural network
    % we need to recode the labels as vectors containing only values 0 or 1
    labels = zeros(num_labels, 1); % create 10*1 matrix as labels,init as 0
    result = y(i);                 % get labels
    labels(result) = 1;            % let correct site be 1
    % calculate cost function
    J = J +  log(Layer_Output(i, :)) * (-labels) - log(1 - Layer_Output(i, :)) * (1-labels);

    % difference of final result and output
    diff_output = Layer_Output(i, :)' - labels; % actually (x-y)^2/2 derivative to be x-y
    % partial derivative for backpropogation
    delta2 = diff_output * Layer_Hidden3(i, :);
    % chain rule for hidden layer to compute difference
    diff_hidden = Theta2(:, 2:end)' * diff_output .* sigmoidGradient(Layer_Hidden1(i, :)');
    delta1 = diff_hidden * X(i, :);

    Theta2_grad = Theta2_grad + delta2;
    Theta1_grad = Theta1_grad + delta1;
end

J = J / m;
Theta2_grad = Theta2_grad / m;
Theta1_grad = Theta1_grad / m;

% Implement regularization with the cost function and gradients.
Theta1_regular = [zeros(hidden_layer_size,1), Theta1(:, 2:end)];
Theta2_regular = [zeros(num_labels,1), Theta2(:, 2:end)];

J = J + (sum(sum(Theta1_regular.^2)) + sum(sum(Theta2_regular.^2))) * lambda/ 2 / m;
Theta1_grad = Theta1_grad + Theta1_regular * lambda / m;
Theta2_grad = Theta2_grad + Theta2_regular * lambda / m;


















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
