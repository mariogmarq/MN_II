
# Metodo de Newton-Raphson para encontrar una raiz de una funcion
function NewtonRaphson(f::Function, fprime::Function, x₀::Number, ε::AbstractFloat = 10e-6, maxiter::Integer=1000000)
    xₙ = x₀
    for _ in 1:maxiter
        x₊ = xₙ - f(xₙ)/fprime(xₙ)
        if abs(x₊) < ε
            return x₊
        else
            xₙ = x₊
        end 
    end

    return xₙ
end

function ejemplo()
    f(x) = x^2 - 5
    fprime(x) = 2x
    x₀ = 5
    print(NewtonRaphson(f, fprime, x₀))
end