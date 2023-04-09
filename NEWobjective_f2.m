function [fval] = NEWobjective_f2(x)
% objective function for fmincon
load ./data/data_factor_minor_factor factor Cb
% fval=x(1)+x(2)+x(3)+x(4)+x(5)+x(6)+x(7)+x(8)+x(9)+x(10)+x(11)+x(12)+x(13)+x(14)+x(15)+x(16);
x(9)=0;
x(10)=0;
x(11)=0;
x(12)=0;
fval=factor'*[x(1);x(2);x(3);x(4);x(5);x(6);x(7);x(8);x(9);x(10);x(11);x(12);x(13);x(14);x(15);x(16)];
end