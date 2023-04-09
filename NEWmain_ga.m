% ga
% clc,clear
clear
load ./data/data_factor
tmax = 1;
data_ga=zeros(4*dc,tmax);
data_Q=zeros(dc,tmax);
data_E=zeros(dc,tmax);
factor=zeros(4*dc,1);
E=E0;
Q=Q0;
X=X0;
opts2=optimoptions('ga','display','iter');
% opts2=optimoptions('ga','display','off', 'MaxGenerations', 2);
% opts2=optimoptions('ga','display','off', 'MaxGenerations', 2,...
%     'PopulationSize', 50);
% opts2=optimoptions('ga','display','iter',...
%     'MaxGenerations', 1000,...
%     'PopulationSize', 50,...
%     'PenaltyFactor',100);
% opts2=optimoptions('ga','display','iter','FunctionTolerance',1);
st=tic;
for t = 1:tmax
    st0 = tic;
        %% -------------objective function---------------
     W=c(:,t)+hw*eps_I(:,t)+hu*phi_G(:,t);
     factor(1:dc,:)=Q;% ai
     factor(dc+1:2*dc,:)=(V.*alpha.*(W.*PUE+hw*eps_D)-Q); % bi
     factor(2*dc+1:3*dc,:)=(X+V.*W); % D
     factor(3*dc+1:4*dc,:)=V.*(hu*phi_r-W); % r
     Ediff=Emax-E;
     save ./data/data_factor_ga_factor factor
     
     % cons
     cons_min_max(1:dc,1)=ones(dc,1)*1/4*1/4*A(t);
     cons_min_max(1:dc,2)=bmax; % a
     cons_min_max(dc+1:2*dc,1)=min([Q ones(dc,1)*1/4*1/4*A(t)],[],2);
     cons_min_max(dc+1:2*dc,2)=min([Q bmax],[],2); % range of b
     cons_min_max(2*dc+1:3*dc,1)=-min([-Dmin E],[],2);
     cons_min_max(2*dc+1:3*dc,2)=min([Dmax Ediff],[],2); % D
     cons_min_max(3*dc+1:4*dc,1)=zeros(dc,1);
     cons_min_max(3*dc+1:4*dc,2)=rmax(:,t); % r
     
     cons_Aeq=[ones(1,dc) zeros(1,3*dc)];
     cons_inAeq=-[zeros(dc,dc) diag(PUE.*alpha) eye(dc) -eye(dc)];% G>0 cons
     cons_inAeq0=zeros(dc,1);

    [x,fval] = ga(@NEWga_f,16,cons_inAeq,cons_inAeq0,cons_Aeq,A(t),cons_min_max(:,1),cons_min_max(:,2),[],opts2);

    x = x';
     % queue update
     X=X+x(2*dc+1:3*dc);
     E=E+x(2*dc+1:3*dc);
     Q=max(Q-x(dc+1:2*dc),0)+x(1:dc);
     data_ga(:, t) = x;
     data_Q(:,t)=Q;
     data_E(:,t)=E;

     ts0 = toc(st0);
     disp(['t: ', num2str(t), ' time: ', num2str(ts0), ' total time: ', num2str(toc(st)) ]);
end
ts_main_ga=toc(st)

save ./data/main_ga_data_1
%  277            55600      -4.607e+04      -4.604e+04        0


% diff = sum(data_ga(1:dc,:)) - A(1:tmax);
% figure(112)
% plot(diff(1:tmax))


