using Plots

a = 14.4
k = 4.7

thetaPreyDeg = 2pi
dTheta = 0.01
maxTheta = 4pi
cases = ["1", "2"]


function F(theta)
    return r0 * exp.(theta / sqrt.(21.09))
end

for case in cases
    global r0 = -1
    theta0 = -1

    if case=="1"
        r0 = a / (k + 1)
        theta0 = 0
    else
        r0 = a / (k - 1)
        theta0 = -pi
    end

    theta1 = theta0 + maxTheta
    thetaHunt = theta0:dTheta:theta1
    thetaPrey = thetaPreyDeg * pi/180 + 2 * theta0

    plt =plot(proj=:polar, aspect_ratio=:equal, dpi=500, title="Lab02", legend=true)
    plot!(plt, [theta0, theta0], [a, F(theta0)], label = false, color=:red)
    plot!(plt, thetaHunt, F, label="Траектория Охраны", color=:red)
    plot!(plt, [0, thetaPrey], [0, F(thetaPrey) + 20], label=:"Траектория браконьеров")

    plot!(plt, [theta0], [a], seriestype=:scatter, label=:"Точка начала (Охраны)", color=:red)
    plot!(plt, [0], [0], seriestype=:scatter, label=:"Точка начала (браконьеров)", color=:green)
    plot!(plt, [thetaPrey], [F(thetaPrey)], seriestype=:scatter, label=:"Точка пересечения" ,color=:blue)

    savefig(plt, case * " Case.png")
end