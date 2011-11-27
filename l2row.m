function [Y,N] = l2row(X) % L2 Normalize X by rows
    % We also use this to normalize by column with l2row(X')
    N = sqrt(sum(X.^2,2) + 1e-8);
    Y = bsxfun(@rdivide,X,N);
end
