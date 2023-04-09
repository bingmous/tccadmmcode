% lyapunov
% consider battery cost
%-------------------------------
% clc,clear
% load ./data/data_factor
% tmax=2784;
% tmax=100;
% Cb = 0;
%---------------------------
data_lya=zeros(4*dc,tmax);
data_Q=zeros(dc,tmax);
data_E=zeros(dc,tmax);
factor=zeros(4*dc,1);
E=E0;
Q=Q0;
X=X0;
% opts2=optimoptions('linprog','diplay','iter');
opts1=optimoptions('linprog','display','off');
% opts2=optimoptions('fmincon','display','off');
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
     % cons
     cons_min_max(1:dc,1)=ones(dc,1)*1/4*1/4*A(t);
     cons_min_max(1:dc,2)=bmax; % a
     cons_min_max(dc+1:2*dc,1)=min([Q ones(dc,1)*1/4*1/4*A(t)],[],2);
     cons_min_max(dc+1:2*dc,2)=min([Q bmax],[],2); % range of b
     cons_min_max(2*dc+1:3*dc,1)=-min([-Dmin E],[],2);
     cons_min_max(2*dc+1:3*dc,2)=min([Dmax Ediff],[],2); % D
     cons_min_max(3*dc+1:4*dc,1)=zeros(dc,1);
     cons_min_max(3*dc+1:4*dc,2)=rmax(:,t); % r

     
     cons_Aeq(1,1:dc*4)=[ones(1,dc) zeros(1,3*dc)];
     cons_inAeq=-[zeros(dc,dc) diag(PUE.*alpha) eye(dc) -eye(dc)];% G>0 cons
     cons_inAeq0=zeros(dc,1);
%      save ./data/data_factor_minor_factor factor Cb V
     save ./data/data_factor_minor_factor
     
     %---------------------r0-----------------#xxx
%      cons_min_max(3*dc+1:4*dc,1)=zeros(dc,1);
%      cons_min_max(3*dc+1:4*dc,2)=zeros(dc,1);
     
%      %---------without battery--------------------
%      cons_min_max(2*dc+1:3*dc,1) = 0;
%      cons_min_max(2*dc+1:3*dc,2) = 0;
%      lya=linprog(factor,cons_inAeq,cons_inAeq0,cons_Aeq,A(t),cons_min_max(:,1),cons_min_max(:,2),[],opts1);
     
        %--------without battery2-------------------
%         fun2 = @NEWobjective_f2;
%         x02=[cons_min_max(1:dc,1)',cons_min_max(dc+1:2*dc,1)',0,0,0,0,cons_min_max(3*dc+1:4*dc,2)'];
%         cons_min_max(2*dc+1:3*dc,1)=0;
%         cons_min_max(2*dc+1:3*dc,2)=0;
%         lya = fmincon(fun2,x02,cons_inAeq,cons_inAeq0,cons_Aeq,A(t),cons_min_max(:,1),cons_min_max(:,2),[],opts2)';
        
     
       %-----------------lya---------------------
%      lya=linprog(factor,cons_inAeq,cons_inAeq0,cons_Aeq,A(t),cons_min_max(:,1),cons_min_max(:,2),[],opts2);
     
       % ---------with battery cost schema1-----------
%      fun = @NEWobjective_f;
%      fun2 = @NEWobjective_f2;
%      x0=[cons_min_max(1:dc,1)',cons_min_max(dc+1:2*dc,1)',cons_min_max(2*dc+1:3*dc,1)',cons_min_max(3*dc+1:4*dc,2)'];
%      lya1= fmincon(fun,x0,cons_inAeq,cons_inAeq0,cons_Aeq,A(t),cons_min_max(:,1),cons_min_max(:,2),[],opts2)';
%      
%      x02=[cons_min_max(1:dc,1)',cons_min_max(dc+1:2*dc,1)',0,0,0,0,cons_min_max(3*dc+1:4*dc,2)'];
%      cons_min_max(2*dc+1:3*dc,1)=0;
%      cons_min_max(2*dc+1:3*dc,2)=0;
%      lya2 = fmincon(fun2,x02,cons_inAeq,cons_inAeq0,cons_Aeq,A(t),cons_min_max(:,1),cons_min_max(:,2),[],opts2)';
%      cons_min_max(2*dc+1:3*dc,1) = 0;
%      cons_min_max(2*dc+1:3*dc,2) = 0;
%      [lya2,fval]=linprog(factor,cons_inAeq,cons_inAeq0,cons_Aeq,A(t),cons_min_max(:,1),cons_min_max(:,2),[],opts1);
%      if NEWobjective_f(lya1) > fval
%      if NEWobjective_f(lya1) > NEWobjective_f2(lya2)
%          lya=lya2;
%      else
%          lya=lya1;
%      end

% ----------------------------schema2 ----------------
     [lya1, fval1]=linprog(factor,cons_inAeq,cons_inAeq0,cons_Aeq,A(t),cons_min_max(:,1),cons_min_max(:,2),[],opts1);
     
     cons_min_max(2*dc+1:3*dc,1) = 0;
     cons_min_max(2*dc+1:3*dc,2) = 0;
     [lya2,fval2]=linprog(factor,cons_inAeq,cons_inAeq0,cons_Aeq,A(t),cons_min_max(:,1),cons_min_max(:,2),[],opts1);
    xxx = NEWobjective_f(lya2);

    
    
     if NEWobjective_f(lya1) > NEWobjective_f(lya2)
%      if NEWobjective_f3(lya1) > NEWobjective_f3(lya2) % no reason and cannot be used
         lya = lya2;
     else
         lya = lya1;
     end
     % queue update
     X=X+lya(2*dc+1:3*dc);
     E=E+lya(2*dc+1:3*dc);
     Q=max(Q-lya(dc+1:2*dc),0)+lya(1:dc);
     data_lya(:,t)=lya;
     data_Q(:,t)=Q;
     data_E(:,t)=E;
%           disp(['t: ',num2str(t)])
end
ts_main_lya=toc(st)
% save ./data/main_lya_data100

%----------------do not touch this-------------------
% save ./data/main_lya_minor_data_bc0000
% save ./data/main_lya_minor_data_bc0000_used
%------------------------------------------------not use anymore
% save ./data/main_lya_minor_data_r0_bc0000 #xxx
% save ./data/main_lya_minor_data_f3_bc0000