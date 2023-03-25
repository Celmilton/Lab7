using Plots
using DifferentialEquations

"Коэффициент Уравнения 1"
a1 = 0.77
a2 = 0.000075

"Коэффициент Уравнения 2"
b1 = 0.000075
b2 = 0.77

"Коэффициент Уравнения 3"
c1 = 0.2
c2 = 0.7
N = 1203    
n0 = 15


function  odn_f(du, u, p, t)
    x, y, z = u
    du[1]= (a1+a2*u[1])*(N-u[1])                 
    du[2]= (b1+b2*u[1])*(N-u[1])                     
    du[3]= (c1*cos(t)+c2*cos(t)*u[1])*(N-u[1])           
end
u0 = [n0, n0, n0]
tspan =(0.0, 30.0)
prob1 = ODEProblem(odn_f, u0, tspan)
sol1 = solve(prob1, dtmax=0.1)

N1 = [u[1] for u in sol1.u]
N2 = [u[2] for u in sol1.u]
N3 = [u[3] for u in sol1.u]
T = [t for t in sol1.t]

plt = 
    plot(
        layout=(1),
        dpi=300,
        legend=true)
        
    plot!(
        plt[1],
        T,
        N3,
        title="График N",
        label="Решение Уравнения 3",
        color=:gray)
    

        savefig("lab7_3.png")