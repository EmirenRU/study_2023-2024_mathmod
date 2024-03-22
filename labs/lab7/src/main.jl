using Plots
using DifferentialEquations

const N = 1040
const n0 = [9]
const alpha = 0.94
const beta = 0.000094 
const t = (0, 2.5)

function AD(du, u, p, t)
    du[1] = (alpha + beta*u[1])*(N - u[1])
end

prob = ODEProblem(AD, n0, t)
solv = solve(prob, dtmax=0.05)

plt = plot(
    solv,
    dpi = 256,
    size = (400,400),
    xlabel="Время",
    ylabel="n(t)",
    label="n(t) - Кол-во заинтересованных людей в рекламе"
)

savefig(plt, "img/first.png")

function AD(du, u, p, t)
    du[1] = (beta + alpha*u[1])*(N - u[1])
end

prob = ODEProblem(AD, n0, t)
solv = solve(prob, dtmax=0.5)

plt = plot(
    solv,
    dpi = 256,
    size = (400,400),
    xlabel="Время",
    ylabel="n(t)",
    label="n(t) - Кол-во заинтересованных людей в рекламе"
)

savefig(plt, "img/second.png")

function AD(du, u, p, t)
    du[1] = (alpha*sin(t) + alpha * sin(t) * u[1])*(N - u[1])
end

prob = ODEProblem(AD, n0, t)
solv = solve(prob, dtmax=0.5)

plt = plot(
    solv,
    dpi = 256,
    size = (400,400),
    xlabel="Время",
    ylabel="n(t)",
    label="n(t) - Кол-во заинтересованных людей в рекламе"
)

savefig(plt, "img/third.png")