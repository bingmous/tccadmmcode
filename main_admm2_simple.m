% ADMM
% clc,clear
% load ./data/data_factor
% tmax=1000;
% V=0;
rho=2;
yk=zeros(4*dc,1); % def size
zk=zeros(dc,1);
dk=zk; 
data_ad=zeros(4*dc,tmax);
data_Q=zeros(dc,tmax);
I=[1 0 0 0];
H_ad1=diag(I)*rho;
H_ad2=eye(dc)*rho;
f_ad1=zeros(4,1);
f_ad2=zeros(dc,1);
yk_temp=zeros(4,dc);
cons_inAeq_ad=zeros(dc,4);
cons_min_max_ad=zeros(4,2,dc); % def size for cons
E=E0;
Q=Q0;
X=X0;
flag_r=0; % def
flag_s=0;
eps_pri=0;
eps_dual=0;
eps_abs=0.01; % absolute tolerance
eps_rel=0.0001; % relative tolerance
opts=optimoptions('quadprog','display','off');
st=tic;
%% -----------------------------ADMM-----------------------------------
for t=1:tmax % time slot    
    %% -------------objective function---------------
    W=c(:,t)+hw*eps_I(:,t)+hu*phi_G(:,t);
    factor(1:dc,:)=Q;% ai
    factor(dc+1:2*dc,:)=(V*alpha.*(W.*PUE+hw*eps_D)-Q); % bi
    factor(2*dc+1:3*dc,:)=(X+V*W); % D
    factor(3*dc+1:4*dc,:)=V*(hu*phi_r-W); % r
    Ediff=Emax-E;
    %% --------------cons-------------------
    for d=1:dc
        cons_min_max_ad(1,1,d)=1/4*1/4*A(t);
        cons_min_max_ad(1,2,d)=bmax(d); % a
        cons_min_max_ad(2,1,d)=min([Q(d) 1/4*1/4*A(t)]);
        cons_min_max_ad(2,2,d)=min([Q(d) bmax(d)]); % b
        cons_min_max_ad(3,1,d)=-min([-Dmin(d) E(d)]);
        cons_min_max_ad(3,2,d)=min([Dmax(d) Ediff(d)]); % D
        cons_min_max_ad(4,1,d)=0;
        cons_min_max_ad(4,2,d)=rmax(d,t);
        cons_Aeq_ad=ones(1,dc);
        cons_inAeq_ad(d,:)=-[0 alpha(d)*PUE(d) 1 -1];
    end
    %% -------begin here----------
    iter=0; % iteration number
    while flag_r>eps_pri || flag_s>eps_dual || iter==0 % iteration flag
        %% ---------------function 1------------------------
        for d=1:dc
%             for d2=1:4 % calculate factors variables
%                 f_ad1(d2)=factor(dc*d2-dc+d)+dk(dc*d2-dc+d)-rho*zk(dc*d2-dc+d);
%             end
            f_ad1(1)=factor(dc*1-dc+d)+dk(dc*1-dc+d)-rho*zk(dc*1-dc+d);
            f_ad1(2)=factor(dc*2-dc+d);
            f_ad1(3)=factor(dc*3-dc+d);
            f_ad1(4)=factor(dc*4-dc+d);
            [yk_temp(:,d),~,~]=quadprog(H_ad1,f_ad1,cons_inAeq_ad(d,:),0,[],[],cons_min_max_ad(:,1,d),cons_min_max_ad(:,2,d),[],opts);
%                 if (exitflag~=1)
%                     disp(['stop at: yk ',num2str(t),' d ',num2str(d),' iter ',num2str(iter)])
%                     pause
%                 end
        end
        yk_temp2=yk_temp';
        yk=reshape(yk_temp2,dc*4,1);
        %% ----------------- function 2-----------------------
        for d=1:dc % calculate factors
            f_ad2(d)=-dk(d)-rho*yk(d);
        end
        zk0=zk; % record old zk
        [zk,~,~]=quadprog(H_ad2,f_ad2,[],[],cons_Aeq_ad,A(t),[],[],[],opts);
%             if (exitflag~=1)
%                 disp(['stop at: zk ',num2str(t)])
%                 pause
%             end
        %% -------------------function 3-----------------------
        dk=dk+rho*(yk(1:dc)-zk); % yk update
        %% -----stop condition--------
        flag_r=norm(yk(1:dc)-zk);  % primal residual
        flag_s=rho*norm((zk-zk0)); % dual residual
        eps_pri=eps_abs+eps_rel*max(norm(yk(1:dc)),norm(zk));
%             max(norm(yk),norm(zk)) % 600
        eps_dual=sqrt(dc)*eps_abs+eps_rel*norm(dk); 
%             norm(dk) % 1000
        iter=iter+1;
        if iter==1000
            break
        end
    end
    %% ------------------queue update----------------------
    X=X+yk(2*dc+1:3*dc);
    E=E+yk(2*dc+1:3*dc);
    Q=max(Q-yk(dc+1:2*dc),0)+yk(1:dc);
    % record data
    data_Q(:,t)=Q;
    data_ad(:,t)=yk;
    % iteration initialize
    yk=yk*0;
    zk=zk*0;
    dk=dk*0;
    disp(['time:',num2str(t),' iter:',num2str(iter)])
end

ts_main_ad=toc(st)
save ./data/main_ad2_sim_data

% equality constrain
figure(19)
b1=data_ad(1:dc,:); 
plot(sum(b1)-A(1:tmax))
title('workload difference')
hold on



