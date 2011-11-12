function [y] = l2row(x)
    normeps = 1e-8;
    epssumsq = sum(x.^2, 2) + normeps;
    l2rows = sqrt(epssumsq);
    y = bsxfun(@rdivide, x, l2rows);
end
