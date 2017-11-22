function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);       %300*2

% You need to return the following variables correctly.
centroids = zeros(K, n);     %3*2


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

index1 = find(idx==1);              %find�в����еȺŶ�Ӧ��Ϊ�е�==�����ص�������ֵ������Ԫ��ֵ
index2 = find(idx==2);
index3 = find(idx==3);
X1 = X(index1,:);
X2 = X(index2,:);
X3 = X(index3,:);
centroids(1,:) = mean(X1);    %��ƽ��ֵ���Ծ�����˵�����ص���һ��������������ÿ�е�ƽ��ֵ 
centroids(2,:) = mean(X2);
centroids(3,:) = mean(X3);

%ʹ��forѭ��
% for i = 1:K
%     count = 0;
%     for j = 1:m
%         if idx(j) == i
%             count = count + 1;
%             centroids(i,:) = centroids(i,:) + X(j,:);
%         end
%     end
%     centroids(i,:) = centroids(i,:) / count;
% end
    






% =============================================================


end

