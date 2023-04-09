clear,clc
load ./data/data_source/water_eps_I eps_I
% interpolate
xq=1:0.25:744;
eps_I=interp1(eps_I,xq);
eps_I=eps_I(1:2784,:);

figure(13)
% for d=1:4
%     subplot(2,2,d)
%     plot(eps_I(:,d))
% %     axis([0 inf 0 inf])
% end
subplot(2,2,1)
plot(eps_I(:,1))
axis([0 inf 13 30])

subplot(2,2,2)
plot(eps_I(:,2))
axis([0 inf 13 35])

subplot(2,2,3)
plot(eps_I(:,3))
axis([0 inf 8 20])

subplot(2,2,4)
plot(eps_I(:,4))
axis([0 inf 7 20])


eps_I=eps_I';
save ./data/data_eps_I eps_I

