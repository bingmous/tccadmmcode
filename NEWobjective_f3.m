function [fval] = NEWobjective_f3(x)
% objective function for fmincon
% load ./data/data_factor_minor_factor factor Cb V
load ./data/data_factor_minor_factor
% fval=x(1)+x(2)+x(3)+x(4)+x(5)+x(6)+x(7)+x(8)+x(9)+x(10)+x(11)+x(12)+x(13)+x(14)+x(15)+x(16);

% used for computing actual cost, c w u Cb
data_lya = [x(1);x(2);x(3);x(4);x(5);x(6);x(7);x(8);x(9);x(10);x(11);x(12);x(13);x(14);x(15);x(16)];

b1=data_lya(1:dc);              %ai
b2=data_lya(dc+1:2*dc);     %bi 4*2784
b3=data_lya(2*dc+1:3*dc); %Di
b4=data_lya(3*dc+1:4*dc); %ri
% --------------total cost--------------------------
tmax = 1;
p=repmat(alpha1,1,tmax).*b2;
G=p.*repmat(PUE,1,tmax)+b3-b4;
water=hw*sum(repmat(eps_D,1,tmax).*p+eps_I(:,1:tmax).*G);
elec=sum(c(:,1:tmax).*G);
carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b4);
total_cost = elec+water+carbon +...
    +NEWindicator_f(x(9),Cb)...
    +NEWindicator_f(x(10),Cb)...
    +NEWindicator_f(x(11),Cb)...
    +NEWindicator_f(x(12),Cb);
fval = total_cost;
end