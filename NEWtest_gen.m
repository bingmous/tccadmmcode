% test data generate
clc,clear
load ./data/data_c c
load ./data/data_eps_I eps_I
load ./data/data_phi_G phi_G
load ./data/data_A A
load ./data/data_r rmax
dc=4; % data center
tmax=2784; % time slot 2784 29 days
% rmax=rmax*4;
%% ----------------------data center parameter----------------------
Mmax=[30000 28000 22000 25000]'/1000; % servers : k
smax=[7 8 10 9]'; % process speed  /15-min
bmax=smax.*Mmax; % process capacity
bmin=[0 0 0 0]';
alpha=[9 9 9 9]'; % relate power to cpu speed //p : KWh
alpha1 = alpha;
PUE=[1.2 1.2 1.2 1.2]'; % power usage effectiveness
% peak=alpha.*PUE.*bmax.*4/1000   % peak power
% all_bmax=sum(bmax)  % max capacity
eps_D=[2.5 2.5 2.5 2.5]'; % direct water L/KWh 
phi_r=[22.5 22.5 22.5 22.5]'; % carbon emission rate for renewable energy (wind)
%% ------------------battery parameters------------------------
Emax=[300 300 300 300]'*3/3;% battery range KWh
Emin=[0 0 0 0]';
Dmax=[30 30 30 30]'*3/3; % charge range KWh
Dmin=-Dmax;
E0=0*Emax;  % battery initial value
%% ------------------ weight parameter------------------
hw=1.2/10^3; % water  dollar /ton
hu=0.5/10^4; % carbon tax dollar/ton :/g
%% ---------------------Vmax--------- --------------------
W=c+hw*eps_I+hu*phi_G;
Wmax=max(W,[],2);
Wmin=min(W,[],2);
% (Emax+Dmin-Dmax)./(Wmax-Wmin)
Vmax=min((Emax+Dmin-Dmax)./(Wmax-Wmin));
V=Vmax;
%% --------------------queue----------------------------
X0=E0+Dmin-V*Wmax; % queue initialize X0=E0 - Dmin - VWmax
Q0=[0 0 0 0]';  % job queue

%% --------------------------minor----------------
Cb = 0.1;

%% -------------------constrains---------------------
%% for lyapunov
% cons_Aeq(1,1:dc*4)=[ones(1,dc) zeros(1,3*dc)];
% cons_inAeq=-[zeros(dc,dc) diag(PUE.*alpha) eye(dc) -eye(dc)];% G>0 cons
% cons_inAeq0=zeros(dc,1);
%% for greedy
% cons_Aeq_gre(1,1:dc*3)=[ones(1,dc) zeros(1,2*dc)];
% cons_inAeq_gre=-[diag(PUE.*alpha) eye(dc) -eye(dc)];
% cons_inAeq0_gre=zeros(dc,1);
%% for admm2
% cons_Aeq_ad(1,1:dc*4)=[ones(1,dc) zeros(1,3*dc)];
% cons_inAeq_ad=zeros(dc,4);
% cons_min_max_ad=zeros(4,2,dc); % def size
% for d=1:dc
%     cons_min_max_ad(1,1,d)=0;
%     cons_min_max_ad(1,2,d)=bmax(d); % a
%     cons_min_max_ad(2,1,d)=min([Q(d) 0*bmax(d)]);
%     cons_min_max_ad(2,2,d)=min([Q(d) bmax(d)]); % b
%     cons_min_max_ad(3,1,d)=Dmin(d);
%     cons_min_max_ad(3,2,d)=Dmax(d); % D
%     cons_min_max_ad(4,1,d)=0;
%     cons_min_max_admm(4,2,d)=rmax(d); % time-vary
%     cons_inAeq_ad(d,:)=-[0 alpha(d)*PUE(d) 1 -1];
%     cons_inAeq0_ad=0;
% end

save ./data/data_factor

% v2_2
% update v1_2 modify  Q
% modify Q
% v2_1
% modify admm

