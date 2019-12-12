function [v] = spectralApprox(LB,W_max,D_max,degree_based)

n=size(LB,1);
maxIter=30*log(n)*sqrt(log(n));

if degree_based
    L_tilde = 6*D_max^2*eye(n)-LB;
    
else
    L_tilde = 4*D_max*(W_max + 1)*eye(n)-LB;
end

L_tilde = sparse(L_tilde);

%% Step 1: initialize
v = normrnd(0,1,n,1);
v = v/norm(v);

%% Step 2: normalize
v1=ones(n,1);
v = v - (v1'*v)/(v1'*v1)*v1;

%% Step 3: apply operator
v_old = zeros(n,1);
round = 0;
while round<maxIter
    round = round + 1;
    v_old = v;
    LL = L_tilde*v;
    v = LL/norm(LL);
end

end
