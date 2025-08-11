function [ agm ] = unc_agm_model( ups, pid )

% extract UPS model
A1 = ups.A1;
A2 = ups.A2;
B  = ups.B;
C  = ups.C;
E  = ups.E;

% extract PID model
A_c = pid.A_c;
B_c = pid.B_c;
[m,n] = size(B_c);

% augmented model (at each polytope vertice)
B_a  = [ B; zeros(m,1) ];
C_a  = [ C  zeros(1,m) ];
E_a  = [ E; zeros(m,1)];
D_a  = 0;

if m ~= 0
    B_cC = B_c*C;
else
    B_cC = [];
end
A1_a = [ A1     zeros(2,m);
        -B_cC   A_c ];
A2_a = [ A2     zeros(2,m);
        -B_cC   A_c ];
B_v  = [ zeros(2,1); B_c ];

agm = struct('A1_a', A1_a, 'A2_a',A2_a, 'B_a',B_a, 'C_a',C_a, 'D_a',D_a, 'E_a',E_a, 'B_v',B_v);