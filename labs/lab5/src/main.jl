using Plots
using DifferentialEquations

x0 = 8
y0 = 16

function F(du, u, p, t)
    du[1] = -0.83*u[1] + 0.083*u[1]*u[2]
    du[2] = 0.82*u[2] - 0.082*u[1]*u[2]
end

u0=[x0,y0]
t = (0,50)
prob = ODEProblem(F, u0, t)
solv = solve(prob, dtmax = 0.1)

A1 = [u[1] for u in solv.u]
A2 = [u[2] for u in solv.u]
T =  [t for t in solv.t]

plt = plot(legend=true, label="зависимости численности хищников от численности жертв")
plot!(plt, A1, A2, color=:green, label= "Фазовый портрет", ylabel="Хищники", xlabel="Жертвы")

savefig(plt, "1.png")

plt = plot(legend=true, label="изменения численности хищников и численности жертв")
plot!(plt, T, A1, label = "численность жертв", color=:blue)
plot!(plt, T, A2, label = "численность хищников", color=:red)

savefig(plt, "2.png")

x0 = 0.82/0.082
y0 = 0.83/0.083

u0=[x0,y0]
t = (0,50)
prob = ODEProblem(F, u0, t)
solv = solve(prob, dtmax = 0.1)

A1 = [u[1] for u in solv.u]
A2 = [u[2] for u in solv.u]
T =  [t for t in solv.t]

plt = plot(legend=true, label="изменения численности хищников и численности жертв")
plot!(plt, T, A1, label = "численность жертв", color=:blue)
plot!(plt, T, A2, label = "численность хищников", color=:red)

savefig(plt, "3.png")