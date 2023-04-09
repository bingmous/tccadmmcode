% ADMM
clc,clear
load ./data/data_factor
tmax=1;
% V=0;
xk = zeros(dc*4, 1);
yk=0;
yk0=1;
alphak = 1e-1;

data_ad_TCC=zeros(4*dc,tmax);
data_Q=zeros(dc,tmax);
data_E=zeros(dc,tmax);
factor=zeros(4*dc,1);
lya = zeros(16,1);
E=E0;
Q=Q0;
X=X0;
opts2=optimoptions('linprog','display','off');
% opts2=optimoptions('linprog');
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
     
%      cons_Aeq(1,1:dc*4)=[ones(1,dc) zeros(1,3*dc)];
%      cons_inAeq=-[zeros(dc,dc) diag(PUE.*alpha) eye(dc) -eye(dc)];% G>0 cons
        cons_min_max_t = zeros(4,2,dc);
     for d=1:dc
        cons_min_max_t(1,1,d)=1/4*1/4*A(t);
        cons_min_max_t(1,2,d)=bmax(d); % a
        cons_min_max_t(2,1,d)=min([Q(d) 1/4*1/4*A(t)]);
        cons_min_max_t(2,2,d)=min([Q(d) bmax(d)]); % b
        cons_min_max_t(3,1,d)=-min([-Dmin(d) E(d)]);
        cons_min_max_t(3,2,d)=min([Dmax(d) Ediff(d)]); % D
        cons_min_max_t(4,1,d)=0;
        cons_min_max_t(4,2,d)=rmax(d,t);
        cons_inAeq_t(d,:)=-[0 alpha(d)*PUE(d) 1 -1];
    end
%      cons_inAeq0=zeros(dc,1);
     
     iter = 0;
     condition = 100;
     while condition > 10
%      while abs(sum(lya(1:dc)) - A(t)) >10
         iter = iter + 1;
         yk0 = yk;
         factor_t(1:dc, :) = factor(1:dc, :) + ones(4,1) * yk0-1/dc*A(t);
         lya_tmp = zeros(4,dc);
         for d=1:dc
            f_ad1(1)=factor(dc*1-dc+d)+yk0-1/dc*A(t);
            f_ad1(2)=factor(dc*2-dc+d);
            f_ad1(3)=factor(dc*3-dc+d);
            f_ad1(4)=factor(dc*4-dc+d);
            lya_tmp(:, d)=linprog(f_ad1,cons_inAeq_t(d,:),0,[],[],cons_min_max_t(:,1),cons_min_max_t(:,2),[],opts2);

         end
        condition = abs(sum(lya(1:dc)) - A(t));
         lya_t=lya_tmp';
         lya=reshape(lya_t,dc*4,1);
         yk = yk0+alphak*(sum(lya(1:dc)) - A(t));
         
%         flag_r=dc*norm(lya(1:dc)-A(t)/dc);
%         flag_s=norm((yk-yk0)); % dual residual
% 
%         data_ad_TCC(:, iter) = lya;
%         data_flag_r(iter) = flag_r;
%         data_flag_s(iter) = flag_s;


     end
     % queue update
     X=X+lya(2*dc+1:3*dc);
     E=E+lya(2*dc+1:3*dc);
     Q=max(Q-lya(dc+1:2*dc),0)+lya(1:dc);
     data_ad_TCC(:,t)=lya;
     data_Q(:,t)=Q;
     data_E(:,t)=E;
%      disp(["iter: ", num2str(iter)])
end

ts_main_lya=toc(st)
% save ./data/main_Dual_TCC
diff = sum(data_ad_TCC(1:dc, :)) - A(1:tmax);
plot(diff)





