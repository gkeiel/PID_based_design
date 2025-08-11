function [ pid ] = pid_model( p, sel )

if strcmp(sel,'PID')
    % PID controller model
    A_c = [0  1;
           0 -p];
    B_c = [0  1]';
elseif strcmp(sel,'PD')
    % PD controller model
    A_c = -p;
    B_c = 1;
elseif strcmp(sel,'PI')
    % PI controller model
    A_c = 0;
    B_c = 1;
elseif strcmp(sel,'P')
    % P controller
    A_c = [];
    B_c = [];
end

pid = struct('A_c', A_c, 'B_c', B_c);