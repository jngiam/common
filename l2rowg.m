function [G] = l2rowg(X,Y,N,D) % Backpropagate through Normalization
    if (~exist('D','var') || isempty(D))
        error('Requires deltas of previous layer to compute gradient!');
    end
    if (~exist('N','var') || isempty(N))
        [Y,N] = l2row(X);
    end
    G = bsxfun(@rdivide, D, N) - bsxfun(@times, Y, sum(D.*X, 2)./(N.^2));
end

