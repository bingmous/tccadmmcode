% lyapunov
% clc,clear
% load ./data/data_factor
% tmax=2784;
data_lya=zeros(4*dc,tmax);
data_Q=zeros(dc,tmax);
data_E=zeros(dc,tmax);
factor=zeros(4*dc,1);
E=E0;
Q=Q0;
X=X0;
opts2=optimoptions('linprog','display','off');
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
%      cons_inAeq=-[zeros(dc,dc) diag(PUE.*alpha) eye(dc) -eye(dc)];% G>0 cons
     cons_inAeq=-[diag(PUE.*alpha) eye(dc) -eye(dc)];% G>0 cons
     cons_inAeq0=zeros(dc,1);
     
%      lya=linprog(factor,cons_inAeq,cons_inAeq0,cons_Aeq,A(t),cons_min_max(:,1),cons_min_max(:,2),[],opts2);
     lya_PA=linprog(factor,cons_inAeq,cons_inAeq0,[],[],cons_min_max(:,1),cons_min_max(:,2),[],opts2);
    %% -------------------------- PA-------------------------------
%     [~, Index] = sort(c(:, t)), 'descend');
    [~, Index] = sort(c(:, t), 'ascend');
    
    PA = zeros(4,1);
    PA_tmp = ones(dc,1)*1/4*1/4*A(t);
    total_A = A(t) - sum(PA_tmp);
    bmax_tmp = bmax - PA_tmp;
    for d = Index'
        PA(d) = min(total_A, bmax_tmp(d));
        total_A = total_A - PA(d);
    end
    PA = PA + PA_tmp;
    lya_PA = [PA; lya_PA];
     % queue update
     X=X+lya_PA(2*dc+1:3*dc);
     E=E+lya_PA(2*dc+1:3*dc);
     Q=max(Q-lya_PA(dc+1:2*dc),0)+lya_PA(1:dc);
     data_lya(:,t)=lya_PA;
     data_Q(:,t)=Q;
     data_E(:,t)=E;
     
%           disp(['t: ',num2str(t)])

end
ts_main_lya=toc(st)
% save ./data/main_lya_PA_data_pt


