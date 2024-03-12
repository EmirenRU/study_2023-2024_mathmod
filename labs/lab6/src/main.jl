using Plots
using DifferentialEquations

const N = 12400
const I0 = 150
const R0 = 55
const S0 = N - I0 - R0
const alpha = 0.5
const beta = 0.5

function epidemic(du, u, p, t)
    S, I, R = u
    du[1] = 0
    du[2] = -beta* u[2]
    du[3]= beta * u[2]
end

v0 = [S0, I0, R0]
prom = (0.0, 60.0)
prob = ODEProblem(epidemic, v0, prom)
solv = solve(prob, dtmax=0.05)

S = [u[1] for u in solv.u]
I = [u[2] for u in solv.u]
R = [u[3] for u in solv.u]
T = [t for t in solv.t]

plt = plot(dpi = 256,  size = (400,400))
plot!(plt, T, S, label="восприимчивые к болезни")
plot!(plt, T, I, label="распространителями инфекции")
plot!(plt, T, R, label="c иммунитетом к болезни")

savefig(plt, "img/main-1.png")

function epidemic(du, u, p, t)
    S, I, R = u
    du[1] = -alpha*u[1]
    du[2] = alpha*u[1]-beta* u[2]
    du[3]= beta * u[2]
end

v0 = [S0, I0, R0]
prom = (0.0, 60.0)
prob = ODEProblem(epidemic, v0, prom)
solv = solve(prob, dtmax=0.05)

S = [u[1] for u in solv.u]
I = [u[2] for u in solv.u]
R = [u[3] for u in solv.u]
T = [t for t in solv.t]

plt = plot(dpi = 256,  size = (400,400))
plot!(plt, T, S, label="восприимчивые к болезни")
plot!(plt, T, I, label="распространителями инфекции")
plot!(plt, T, R, label="c иммунитетом к болезни")

savefig(plt, "img/main-2.png")