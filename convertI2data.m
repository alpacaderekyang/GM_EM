function [ data ] = convertI2data(I)
n = (size(I,1)-8+1)*(size(I,2)-8+1);
d = 64;
data = zeros(d,n);
count = 1;
for i = 1:size(I,1)-8+1
    for j = 1:size(I,2)-8+1
        patch = I(i:i+7,j:j+7);
        patch = double(patch)-mean2(patch);
        data(:,count) = reshape(patch,[],1);
        count=count+1;
    end
end

end

