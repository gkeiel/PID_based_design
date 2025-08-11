function [ pid_tf, cl_tf, cl_tf_nl, id_tf, k_f ] = unc_get_tf( pid, agm, K, f ) 

% PID controller
D_c       = -K(2);
[num,den] = ss2tf( pid.A_c, pid.B_c, K(3:end), D_c );
pid_tf    = tf(num,den);

% feedforward gain
[num,den] = ss2tf( agm.A2_a +agm.B_a*K, (-K(2)*agm.B_a +agm.B_v), agm.C_a, agm.D_a );
cl_tf     = tf(num,den);
k_f       = 1/abs( evalfr(cl_tf,2*pi*f*1i) );

% closed-loop transfer function nominal load
B_k       = ( -K(2)+k_f )*agm.B_a +agm.B_v;
[num,den] = ss2tf( agm.A2_a +agm.B_a*K, B_k, agm.C_a, agm.D_a );
cl_tf     = tf(num,den);

% closed-loop transfer function no-load
[num,den] = ss2tf( agm.A1_a +agm.B_a*K, B_k, agm.C_a, agm.D_a );
cl_tf_nl  = tf(num,den);

% disturbance-output transfer function
[num,den] = ss2tf( agm.A2_a +agm.B_a*K, agm.E_a, agm.C_a, agm.D_a );
id_tf     = tf(num,den);