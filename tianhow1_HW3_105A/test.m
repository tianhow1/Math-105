f=@(x) x^3-2*x^2-5;
p1 = Mueller(f,0,2,4,1e-6,300);
p2 = Mueller(f,0,-2,-4,1e-6,300);
p3 = Mueller(f,4,8,16,1e-6,300);