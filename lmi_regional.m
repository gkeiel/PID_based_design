function [ K ] = lmi_regional( agm, sig, hfp )

% extract augmented model
A1_a = agm.A1_a;
A2_a = agm.A2_a;
B_a  = agm.B_a;
C_a  = agm.C_a; 

%%%%%%%%%%%%%%%%%%%%%%% regional pole placement %%%%%%%%%%%%%%%%%%%%%%%%%%%
% define symbolic variables (YALMIP* needed)
[n,p]  = size(B_a);
Q      = sdpvar(n,n, 'symmetric');   % n x n symmetric variable
W      = sdpvar(p,n, 'full');        % n x n variable
r      = hfp;

% short form
Sigma1 = A1_a*Q +B_a*W;
Sigma2 = A2_a*Q +B_a*W;

% LMIs for quadratic stability also regional pole placement
LMI = Q>0;

LMI = [ LMI, ...
         (A1_a*Q +B_a*W +Q*A1_a' +W'*B_a')<0 ];

LMI = [ LMI, ...
         (A2_a*Q +B_a*W +Q*A2_a' +W'*B_a')<0 ];

% region 1 constraint (vertical strip at -sig)
LMI = [ LMI,...
         (Sigma1 +Sigma1' +2*sig*Q)<0 ];

LMI = [ LMI,...
         (Sigma2 +Sigma2' +2*sig*Q)<0 ];
     
% region 2 constraint (disk of radius r) 
LMI = [LMI,...
        ([-r*Q,          Sigma1;
           Sigma1',     -r*Q]) < 0];
LMI = [LMI,...
        ([-r*Q,          Sigma2;
           Sigma2',     -r*Q]) < 0];
     
% settings and solve for feasibility
opt                   = sdpsettings('solver','lmilab','verbose',2);     %(better solver recommended)
opt.lmilab.maxiter    = 1000;
opt.lmilab.feasradius = 1e20;
sol                   = optimize(LMI,[],opt);

if sol.problem ~= 0
    disp('Solver failed or problem infeasible.');
    disp(sol.info);
else
    K = value(W)/value(Q);
end

% *J. Lofberg, "YALMIP : a toolbox for modeling and optimization in MATLAB," 2004 IEEE International Conference on Robotics and Automation (IEEE Cat. No.04CH37508), New Orleans, LA, 2004, pp. 284-289, doi: 10.1109/CACSD.2004.1393890.