function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
n = size(X,2);
X1=X(:,1);
X2=X(:,2);
for i = 1:length(y)
    if y(i) == 1
        plot(X1(i), X2(i), 'k+','LineWidth', 2, ...
'MarkerSize', 7);
    else
        plot(X1(i), X2(i), 'ko', 'MarkerFaceColor', 'y', ...
'MarkerSize', 7);
    end
end

        








% =========================================================================



hold off;

end
