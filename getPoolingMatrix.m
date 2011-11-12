function V = getPoolingMatrix(hiddenSize, poolingSize)

% Find best fitting rectangle
ml = round(sqrt(hiddenSize)):-1:1;
cols = ml(find(mod(hiddenSize,ml)==0,1));
rows = hiddenSize / cols;

% Initialize V accordingly, naive code, one time cost
V = zeros(hiddenSize, hiddenSize);
for r1 = 1:rows
    for c1 = 1:cols
        h1 = (r1 - 1)*cols + c1;
        for r2 = r1-poolingSize : r1+poolingSize
            for c2 = c1-poolingSize : c1+poolingSize
                r2i = mod(r2-1,rows) + 1;
                c2i = mod(c2-1,rows) + 1;
                h2 = (r2i - 1)*cols + c2i;
                V(h1, h2) = 1;
            end
        end
    end
end

end