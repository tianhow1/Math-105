
function p=bisection(f,a,b,ToL,N0)
i=1;
FA=f(a);
FB=f(b);
if f(a)*f(b)>0
    disp('the algorithm failed...check domain')
    return
end
while i<=N0
    p=(a+b)/2;
    FP=f(p);
    if or(FP==0,abs(a-b)< ToL)
        return
    end
    
    i=i+1;
    if FA*FP>0
        a=p;
        FA=FP;
    else 
        b=p;   
    end
end

if abs(a-b)> ToL
    disp('the algorithm failed...');
    return
end
end
