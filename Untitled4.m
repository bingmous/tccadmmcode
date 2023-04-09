clear,clc
load ./data/data_factor
aa = 500;
[~, Index] = sort(c(:, 1), 'ascend')

pa = zeros(4,1)
for d = Index'
    pa(d) = min(aa, bmax(d));
    aa = aa - pa(d);
end
aa
bmax
pa
sum(pa)
c(:,1)