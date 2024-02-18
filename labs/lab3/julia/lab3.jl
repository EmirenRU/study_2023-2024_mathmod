using Plots
using DifferentialEquations

const x0 = 22022
const y0 = 33033
point0 = [x0, y0]
time = [0.0, 5.0]

a1 = 0.401
b1 = 0.707
c1 = 0.606
h1 = 0.502

a2 = 0.343
b2 = 0.895 
c2 = 0.433
h2 = 0.699

function P1(t)
    return sin(8t)
end

function Q1(t)
    return cos(6t)
end

function P2(t)
    return 2sin(2t)
end

function Q2(t)
    return 2cos(t)
end

function F_1(dp, point, p, t)
    dp[1] = -a1*point[1] - b1*point[2] + P1(t)
    dp[2] = -c1*point[1] - b2*point[2] + Q2(t)
end

function F_2(dp, point, p, t)
    dp[1] = -a2*point[1] - b2*point[2] + P2(t)
    dp[2] = -c2*point[1]*point[2] - h2*point[2] + Q2(t)
end

t=collect(LinRange(0,1,100))
prob1 = ODEProblem(F_1, point0, time)
solv1 = solve(prob1, saveat=t)
prob2 = ODEProblem(F_2, point0, time)
solv2 = solve(prob2, saveat=t)

plt1 = plot(
    solv1,
    color=:red,
    label="Численность войск армии №1",
    title="Модель боевых действий №1",
    xlabel="Время",
    ylabel="Численность войск"
)

plot!(
    solv1,
    color=:blue,
    label="Численность войск армии №2"
)

savefig(plt1, "first_case.png")

plt2 = plot(
    solv2,
    color=:red,
    label="Численность войск армии №1",
    title="Модель боевых действий №2",
    xlabel="Время",
    ylabel="Численность войск"
)

plot!(
    solv2,
    color=:blue,
    label="Численность войск армии №2"
)

savefig(plt2, "second_case.png")

