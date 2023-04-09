% newv2_final_simple

%% ----------ADMM算法说明-------------
% main_admm2
% 所有变量迭代求解
% 第一步单独多个变量求解
% 第二步所有变量求解

% simple
% 在这一文件中修改了ADMM在迭代求解的第二步
% 和第三步中只包含了约束条件中的变量 
% 同时停止准则中只有对等式约束条件中的变量相关的约束
% 求解结果与原来相同，迭代减少

% simple2
% 相比与simple，简化了ADMM第二步迭代
% 使每个数据中心使用同一个对偶变量进行迭代
% 简化计算

%% ----------文件夹说明-------------
% ./data/ ：所有生成的mat数据
% ./data/data_source：需要的源数据
% pic：图片文件夹

%% -----------文件说明---------------
% data_* 文件：仿真数据初始化
% debug_*文件：单独调试算法文件
% main_*文件：算法实现文件
% pt1-11文件：绘图文件
% pt_cost_V_*文件：不同算法分别绘制由run计算的数据
% test_gen：初始化数据
% run_pt_cost_V：运行不同Vmax脚本
% run_pt_renewable_utilization：运行不同rmax脚本
% run_all：脚本

%% --------mat数据说明-----------
% 不同电池容量下不同算法比较
% main_ad2_data_VmaxE000-E1000
% main_gre_data  % 和V无关
% main_sta_data_VmaxE000-E1000

% 不同可再生能源规模下不同算法比较
% main_ad2_data_VmaxE300_r1000_v2-r6000_v2 %1MW 2MW 4MW 6MW 8MW 10MW
% main_gre_data_r0000-r6000
% main_sta_data_VmaxE300_r1000_v2-r6000_v2  % v2表示重新修改计算数据范围1MW 2MW 4MW 6MW 8MW 10MW







