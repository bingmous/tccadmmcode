clear,clc
load ./data/data_c c
load ./data/data_eps_I eps_I
load ./data/data_phi_G phi_G
load ./data/data_factor hu
load ./data/data_factor hw
% cig=[c;eps_I;phi_G];
% plot()
figure(111)

for d=1:4
    subplot(4,4,4*d-3)
    plot(c(d,:))
    disp(['dc:',num2str(d),'avg_c:',num2str(mean(c(d,:)))]);
    subplot(4,4,4*d-3+1)
    plot(hw*eps_I(d,:))
    disp(['dc:',num2str(d),'avg_w:',num2str(mean(hw*eps_I(d,:)))]);
    subplot(4,4,4*d-3+2)
    plot(hu*phi_G(d,:))
    disp(['dc:',num2str(d),'avg_u:',num2str(mean(hu*phi_G(d,:)))]);
    subplot(4,4,4*d-3+3)
    plot(c(d,:)+hu*phi_G(d,:)+hw*eps_I(d,:))
end


