clear,clc
load ./data/data_source/renewable_r r
xq=1:0.25:744;
r=interp1(r,xq);
r=r(1:2784,:)';
% r=repmat(r,4,1)*0.01;
% for d=1:4
%     subplot(2,2,d)
%     plot(r(:,d))
% end
size(r)
s=rng;
r=r+mean(r')'.*rand(size(r));
r=r*0.04;
r(1,:)=r(1,:)*1.2;
r(2,:)=r(2,:)*0.9;
r(3,:)=r(3,:)*0.95;
r(4,:)=r(4,:)*1.09;
rng(s)
% r(1,:)=r(1,:)+30;
rmax=r';
figure(11)
for d=1:4
    subplot(2,2,d)
    plot(rmax(:,d))
    axis([0 inf 0 250])
end
rmax=rmax';
% plot(rmax(:,1))
renewable=r(3,:);
