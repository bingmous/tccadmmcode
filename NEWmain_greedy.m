% greedy algorithm
clear,clc
load ./data/data_factor

tmax=2784;
data_gre=zeros(3*dc,tmax);
data_E=zeros(dc,tmax);
factor=zeros(3*dc,1);
E=E0;
opts2=optimoptions('linprog','display','off');
st=tic;
for t=1:tmax
    %% -------------objective function---------------
     W=c(:,t)+hw*eps_I(:,t)+hu*phi_G(:,t);
     factor(1:dc,:)=alpha.*(W.*PUE+hw*eps_D);% ai=bi
     factor(dc+1:2*dc,:)=W; % Di
     factor(2*dc+1:3*dc,:)=hu*phi_r-W; % ri
     Ediff=Emax-E;
     %% ------------cons----------------
     cons_min_max_gre(1:dc,1)=ones(dc,1)*1/4*1/4*A(t);
     cons_min_max_gre(1:dc,2)=bmax; % ai=bi
     cons_min_max_gre(dc+1:2*dc,1)=-min([-Dmin E],[],2);
     cons_min_max_gre(dc+1:2*dc,2)=min([Dmax Ediff],[],2); % D
     cons_min_max_gre(2*dc+1:3*dc,1)=zeros(dc,1);
     cons_min_max_gre(2*dc+1:3*dc,2)=rmax(:,t); % r
     
     cons_Aeq_gre(1,1:dc*3)=[ones(1,dc) zeros(1,2*dc)];
     cons_inAeq_gre=-[diag(PUE.*alpha) eye(dc) -eye(dc)];
     cons_inAeq0_gre=zeros(dc,1);
     
     gre=linprog(factor,cons_inAeq_gre,cons_inAeq0_gre,cons_Aeq_gre,A(t),cons_min_max_gre(:,1),cons_min_max_gre(:,2),[],opts2);
     % queue update
     E=E+gre(dc+1:2*dc);
     data_gre(:,t)=gre;

     disp(['t: ',num2str(t)])
end
ts_main_gre=toc(st)
save ./data/main_gre_data_pt


