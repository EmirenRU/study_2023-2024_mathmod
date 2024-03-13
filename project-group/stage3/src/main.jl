using Plots
using DifferentialEquations

const N_i = 200
const N_l = 3
const k_l = 1
const m = 1
const k = 1
const d = 1
const omega_0 = sqrt(k/m)

const A = 0 # из условий
const B = 1 # Любое

function Xi(i)
    return i*d
end

function omega_l(l)
    return 2*omega_0*sin( (l*pi) / ( 2 * (N_i+1) ) )
end

function p_l(l)
    return (l * pi) / ((N_i+1) * d)
end

function y_i(i, l)
    return ( A*cos(p[l] * x[i]) + B*sin(p[l]*x[i]) ) * cos(omega[l] )
end

x = [Xi(x) for x in 1:N_i] # vector of x_i = id
omega = [omega_l(l) for l in 1:N_l] 
p = [p_l(l) for l in 1:N_l]

for l in k_l:N_l
    plt = plot(
    dpi=256,
    size=(400,400), 
    label="Гармоническая цепочка")

    y = [y_i(i, l) for i in 1:N_i]   

    plot!(plt, x, y, label="Гармоника №"*string(l), color=:blue)
    savefig(plt, "image/main_" * string(l) * "_.png")
end

plt = plot( dpi=256, size=(400,400),
  label="Гармоническая цепочка")

y = [y_i(i, 1) for i in 1:N_i]   
plot!(plt, x, y, label="Гармоника №1", color=:green)

y = [y_i(i, 2) for i in 1:N_i]   
plot!(plt, x, y, label="Гармоника №2", color=:red)

y = [y_i(i, 3) for i in 1:N_i]   

plot!(plt, x, y, label="Гармоника №3", color=:blue)

savefig(plt, "image/main.png")
