% obtains gains for specified controller
if strcmp(sel,'PID')
    k_i = K(3)/p;
    k_d = -( K(4) -k_i )/p;
    k_p = -K(2) -k_d; 
elseif strcmp(sel,'PD')
    k_i = 0;
    k_d = -K(3)/p;
    k_p = -K(2) -k_d;
elseif strcmp(sel,'PI')
    k_i = K(3);
    k_d = 0;
    k_p = -K(2);
elseif strcmp(sel,'P')
    k_i = 0;
    k_d = 0;
    k_p = -K(2);
end
k_a = K(1);

fprintf('\nController parameters:\n');
fprintf('k_p = %.3f \n', k_p);
fprintf('k_i = %.3f \n', k_i);
fprintf('k_d = %.6f \n', k_d);
fprintf('k_a = %.3f \n', k_a);
fprintf('k_f = %.3f \n', k_f);