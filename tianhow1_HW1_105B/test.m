%%
x = [0,0.5,1];
z = [0.25,0.7];
L_1z = zeros(size(z)); L_2z = zeros(size(z));L_3z = zeros(size(z));
for j = 1:numel(z)
    L_1z(j)=Lagrange_polynomial_basis(x,z(j),1);
    L_2z(j)=Lagrange_polynomial_basis(x,z(j),2);
    L_3z(j)=Lagrange_polynomial_basis(x,z(j),3);
end
%%
f = @(x) x.^2-2;

x = [0,0.5,1];

y = f(x);

z = [0.25,0.75];

Pz = zeros(size(z));

for i = 1:numel(z)

      Pz(i) = Lagrange_interpolation(x,y,z(i));

end

Pz


