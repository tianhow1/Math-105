function secant_method(f, x0, x1, N0)
    
    for i in N0:
        x2 = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
        x0= x1;
        x1=x2;
    return x2
    end
end
