# Metodo para acelerar convergencia de Aitken
function Δ(xₙ::Number, x₋::Number)
    xₙ - x₋
end

function Δ²(x₂, x₁, xₙ)
    x₂ - 2*x₁ + xₙ
end

function Aitken(sucesion::AbstractArray{Number})
    x₀ = sucesion[1]
    x₁ = sucesion[2]
    x₂ = sucesion[3]
    i = 4

    x_gorro = x₀ - Δ(x₁, x₀)/Δ²(x₂, x₁, x₀)
    while i < length(sucesion)
        x₀ = x₁
        x₁ = x₂
        x₂ = sucesion[i]
        i = i + 1

        x_gorro = x₀ - Δ(x₁, x₀)/Δ²(x₂, x₁, x₀)
    end

    x_gorro
end