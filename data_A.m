clear,clc
%2784=29days
load ./data/data_source/tolerant01 tolerant01
% load ./data/data_source/tolerant0 tolerant0
% load ./data/data_source/data_workload tolerant1

% plot(tolerant0)
% A=tolerant0(1500:2500);
% A=repmat(A,1,3)/1000+100;

% plot(A)
tolerant01=tolerant01(1:2784);
A=tolerant01*2+100000;
figure(1)
plot(A)

A=A/1000;
% axis([0 3000 0 600000])


A=A';
save ./data/data_A A

% save ./data/data_source/tolerant0 tolerant0