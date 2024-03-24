using Plots
using DifferentialEquations

const M1_0 = 3.7
const M2_0 = 2.8
const p_cr = 27
const N = 37
const q = 1
const tau1 = 27
const tau2 = 17
const p1 = 6.7
const p2 = 11.7

const a1 = p_cr / (tau1^2 * p1^2 * N * q)
const a2 = p_cr / (tau2^2 * p2^2 * N * q)
const b = p_cr / (tau1^2 * p1^2 * tau2^2 * p2^2 * N * q)
const c1 = (p_cr - p1) / (tau1 * p1)
const c2 = (p_cr - p2) / (tau2 * p2)

m0 = [M1_0, M2_0]
t = (0, 60 / c1 )

function F(dm, m, p, t)
    dm[1] = m[1] - (b/c1)*m[1]*m[2] - (a1/c1)*m[1]^2
    dm[2] = (c2/c1)*m[2] - (b/c1)*m[1]*m[2] - (a2/c1)*m[2]^2
end

prob = ODEProblem(F, m0, t)
solv = solve(prob, dtmax= 0.05)

plt = plot(
    solv,    
    dpi=256,
    size=(400,400),
    xlabel = "t / c1",
    ylabel = "M1, M2",
    label = ["M1(t)" "M2(t)"]    
)

savefig(plt, "img/first.png")

function F(dm, m, p, t)
    dm[1] = m[1] - (b/c1)*m[1]*m[2] - (a1/c1)*m[1]^2
    dm[2] = (c2/c1)*m[2] - (b/c1 + 0.00063)*m[1]*m[2] - (a2/c1)*m[2]^2
end

prob = ODEProblem(F, m0, t)
solv = solve(prob)

plt = plot(
    solv,    
    dpi=256,
    size=(400,400),
    xlabel = "t / c1",
    ylabel = "M1, M2",
    label = ["M1(t)" "M2(t)"]    
)

savefig(plt, "img/second.png")