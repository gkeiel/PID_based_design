%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PLOTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot reference and output for no load
figure(1)
plot(t,r,'--r',t,v_o,'LineWidth',2)
legend('r(t) [V]','v_o(t) [V]');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
title('No load');

% plot reference and output for linear load
figure(2)
plot(t,r,'--r',t,v_o_l,t,i_o_l,'LineWidth',2)
grid on
legend('r(t) [V]','v_o(t) [V]','i_o(t) [A]');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
title('Linear load');

% plot tracking error and control signal for linear load
figure(3)
plot(t,r-v_o_l',t,u_l,'LineWidth',2)
grid on
legend('e(t) [V]','u(t) [V]');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
title('Tracking error and control signal for linear load');

% plot reference and output for non-linear load
figure(4)
plot(t,r,'--r',t,v_o_nl,t,i_o_nl,'LineWidth',2)
legend('r(t) [V]','v_o(t) [V]','i_o(t) [A]');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
title('Non-linear load');

% plot tracking error and control signal for linear load
figure(5)
plot(t,r-v_o_nl',t,u_nl,'LineWidth',2)
grid on
legend('e(t) [V]','u(t) [V]');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
title('Tracking error and control signal for non-linear load');

% PID controller frequency response
figure(6)
opts = bodeoptions('cstprefs');
opts.PhaseWrapping = 'on';
opts.Grid = 'on';
bodeplot(pid_tf,opts)
title('C(s)');
set(findall(gcf,'type','line'),'linewidth',2);

% closed-loop frequency response
figure(7)
bodeplot(cl_tf,opts)
title('T_r(s)');
set(findall(gcf,'type','line'),'linewidth',2);