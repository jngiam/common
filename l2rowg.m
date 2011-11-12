function [grad] = l2rowg(x, y, outderv)
%L2ROWG Assumes examples in columns

    normeps = 1e-8;
    if (~exist('outderv','var')||isempty(outderv))
        error('Requires outderv of previous layer to compute gradient!');
    end
        
    epssumsq = sum(x.^2,2) + normeps;	

    l2rows = sqrt(epssumsq);

    if (~exist('y','var')||isempty(y))
         y = bsxfun(@rdivide,x,l2rows);
    end

    grad = bsxfun(@rdivide, outderv, l2rows) - ...
        bsxfun(@times, y, sum(outderv.*x, 2) ./ epssumsq);
end
