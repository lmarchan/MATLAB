a = 1.0;
x = atan(1.0);
f = cos(a*x);
df = -a*sin(a*x);
vmin = -1.0;
vmax = 100.0;
Nv = 100;
dv = (vmax-vmin)/Nv;
v = vmin-dv;
for k = 1:Nv
    v = v+dv;
    h(k) = exp(-v);
    fap = (f(h(k))-f)/h(k)
    dfe = df(x);
    err(k) = abs(1.0-fap/df)
end
plot(log(err),log(1 ./ h));
xlabel("log(err)");
ylabel("log(1/h)");

