function [S] = Adaptive_quad(f,a,b,d,N,eps0)
% a and b are two endpoints of the sub-interval, d is the current depth, N is the  maximum depth, eps0 is the tolerance.
S1 = Simpson(f,a,b-a);
c = (b+a)/2;
S2 = Simpson(f,a,c-a) + Simpson(f,c,b-c);
if d > N
    disp('error: max depth reached')    
    S = S2;
    return
else
    if abs(S2-S1)<eps0
        S=S2;
        return
    else
        [S]=Adaptive_quad(f,a,c,d+1,N,eps0/2)+Adaptive_quad(f,c,b,d+1,N,eps0/2);
        % sub-divide the interval and call the function "Adaptive_quad" again for both sub-interval with eps0 = eps0/2 and d=d+1;
    end
end


end