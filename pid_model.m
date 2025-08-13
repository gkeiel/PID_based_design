function [ pid ] = pid_model( p, sel )

if strcmp(sel,'PID')
    % PID controller model
    A_c = [0  1;
           0 -p];
    B_c = [0  1]';
    % also C_c = [(k_i-p*k_d) k_i*p], D_c = (k_p+k_d), but need to be computed
elseif strcmp(sel,'PD')
    % PD controller model
    A_c = -p;
    B_c = 1;
    % also C_c = k_d*p, D_c = (k_p+k_d)
elseif strcmp(sel,'PI')
    % PI controller model
    A_c = 0;
    B_c = 1;
    % also C_c = k_i, D_c = k_p
elseif strcmp(sel,'P')
    % P controller
    A_c = [];
    B_c = [];
    % also C_c = [], D_c = k_p
end

pid = struct('A_c', A_c, 'B_c', B_c);