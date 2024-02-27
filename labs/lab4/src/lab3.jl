using Plots
using DifferentialEquations

const x0 = 0.6
const y0 = 1.6
const t = (0, 60)

const a = 6 
const b = 6

p = (a,b)
u0 = [x0, y0]

F0(t) = sin(6*t)

function F(du, u, p, t)
    a,b = p
    du[1] = u[2]
    du[2] = F0(t) - a*du[1] - b *u[1]
end

prob1 = ODEProblem(F, u0, t, p)
solv1 = solve(prob1, dtmax=0.05)

plt1 = plot(solv1, vars=(2,1), color=:red, label = "Фазовый портрет", title="1 случай", xlabel = "x-axis", ylabel="y-axis")
plt2 = plot(solv1, vars=(0,1), color=:blue, label="x(t)", title="1 случай", xlabel="t")
plot!(plt2, solv1, vars=(0,2), color=:green, label="y(t)")

savefig(plt1, "julia3_1.png")
savefig(plt2, "julia3_2.png")
