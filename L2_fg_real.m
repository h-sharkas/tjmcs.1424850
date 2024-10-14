function out = L2_fg_real(u,v)
N = length(u);
L = length(v);

if N~=L
    error('The two input vectors must have the same dimension!');
end

out_m = 0;
out_n = 0;
for n = 1 : N
    for m = 1 : N
        abs_n_m = abs(n - m);
        l = 1 + abs_n_m : N;
        out_l = sum( v(l) .* v(l-abs_n_m) );
        out_m = out_m + ( conj(u(m)) .* out_l );
    end
    out_n = out_n + ( u(n) .* out_m);
    out_m = 0;
end
out = out_n;
end