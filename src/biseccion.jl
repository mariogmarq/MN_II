
# Metodo de la biseccion para encontrar un cero de una funcion f
# Devuelve un intervalo de longitud maxima ε que contiene un cero de la funcion
# 6 digitos de precision por defecto
# Requisitos para poder usar la funcion
# 1) a < b
# 2) f(a)f(b) < 0
function biseccion(a::Number, b::Number, f::Function, ε::AbstractFloat = 10e-6, maxiter::Integer = 100000)
    fa = f(a)
    i = 0

    if fa * f(b) > 0
        throw(DomainError((a, b), "f(a) and f(b) have the same sign"))
    end

    while (b - a) > ε
        i += 1
        if i > maxiter
            break
        end

        xn = (b + a) / 2
        yn = f(xn)

        if abs(yn) < ε
            return (xn, xn)

        elseif yn * fa > 0
            a = xn
            fa = yn
        else
            b = xn
        end
    end

    (a, b)
end


function ejemplo()
    a = 0
    b = 5.0
    f(x) = x^2 - 5
    print(biseccion(a, b, f))
end
