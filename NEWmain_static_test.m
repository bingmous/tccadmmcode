% acroding to capacity of data center to allocate workload
% modify from main_lya
% clc,clear
% load ./data/data_factor
% tmax=2784;
% tmax=1;
data_sta=zeros(4*dc,tmax);
data_Q=zeros(dc,tmax);
data_E=zeros(dc,tmax);
factor=zeros(4*dc,1);
E=E0;
Q=Q0;
X=X0;
opts2=optimoptions('linprog','display','off');
% opts2=optimoptions('linprog','display','iter');
%% -----------------------------Lyapunov-----------------------
st=tic;
for t=1:tmax
    %% -------------objective function---------------
     W=c(:,t)+hw*eps_I(:,t)+hu*phi_G(:,t);
     factor(1:dc,:)=Q;% ai
     factor(dc+1:2*dc,:)=(V.*alpha.*(W.*PUE+hw*eps_D)-Q); % bi
     factor(2*dc+1:3*dc,:)=(X+V.*W); % D
     factor(3*dc+1:4*dc,:)=V.*(hu*phi_r-W); % r
     Ediff=Emax-E;
          %% -------------------------- PA-------------------------------
      factor = factor(dc+1 : 4*dc, :);
     % cons
%      cons_min_max(1:dc,1)=ones(dc,1)*1/4*1/4*A(t);
%      cons_min_max(1:dc,2)=bmax; % a
     cons_min_max(dc+1:2*dc,1)=min([Q ones(dc,1)*1/4*1/4*A(t)],[],2);
     cons_min_max(dc+1:2*dc,2)=min([Q bmax],[],2); % range of b
     cons_min_max(2*dc+1:3*dc,1)=-min([-Dmin E],[],2);
     cons_min_max(2*dc+1:3*dc,2)=min([Dmax Ediff],[],2); % D
     cons_min_max(3*dc+1:4*dc,1)=zeros(dc,1);
     cons_min_max(3*dc+1:4*dc,2)=rmax(:,t); % r
     %% -------------------------- PA-------------------------------
      cons_min_max = cons_min_max(dc+1:4*dc, :);
     
     
%      cons_Aeq(1,1:dc*4)=[ones(1,dc) zeros(1,3*dc)];
     cons_inAeq=-[diag(PUE.*alpha) eye(dc) -eye(dc)];% G>0 cons
     cons_inAeq0=zeros(dc,1);
     
     sta=linprog(factor,cons_inAeq,cons_inAeq0,[],[],cons_min_max(:,1),cons_min_max(:,2),[],opts2);
     
     sta_tmp = [ones(4,1)*1/dc*A(t);sta];
     sta = sta_tmp;
     
     % queue update
     X=X+sta(2*dc+1:3*dc);
     E=E+sta(2*dc+1:3*dc);
     Q=max(Q-sta(dc+1:2*dc),0)+sta(1:dc);
     data_sta(:,t)=sta;
     data_Q(:,t)=Q;
     data_E(:,t)=E;
%      disp(['t: ',num2str(t)])
end
ts_main_sta=toc(st)
% save ./data/main_sta_data_test


