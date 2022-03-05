# Metodo de la secante para encontrar un cero de una funcion, no garantiza convergencia global
function secante(f::Function, x₀::Number, x₁::Number,  ε::AbstractFloat = 10e-6, maxiter::Integer=1000000)
    y₁ = f(x₁)
    y₀ = f(x₀)

    for _ in 1:maxiter
        if abs(y₁) < ε
            return x₁
        end

        xₙ = x₁ - (y₁-(x₁-x₀))/(y₁-y₀)
        y₁, y₀ = f(xₙ), y₁
        x₁, x₀ = xₙ, x₁
    end

    return x₁
end

function ejemplo()
    f(x) = x^2 - 5
    println(secante(f, 2, 3))    
end