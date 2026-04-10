# Definindo a matriz de probabilidade e o vetor inicial
A = sp.Matrix([
    [sp.Rational(7,10), sp.Rational(2,10), sp.Rational(2,10)],
    [sp.Rational(2,10), sp.Rational(6,10), sp.Rational(3,10)],
    [sp.Rational(1,10), sp.Rational(2, 10), sp.Rational(5, 10)]
])

x_0 = sp.Matrix([
    sp.Rational(4,10),
    sp.Rational(2,10),
    sp.Rational(4,10)
])

# Printando como float para ficar mais bonito
sp.pprint(A.evalf())
sp.pprint(x_0.evalf())

# Definindo a matriz de probabilidade e o vetor inicial
A = sp.Matrix([
    [sp.Rational(7,10), sp.Rational(2,10), sp.Rational(2,10)],
    [sp.Rational(2,10), sp.Rational(6,10), sp.Rational(3,10)],
    [sp.Rational(1,10), sp.Rational(2, 10), sp.Rational(5, 10)]
])

x_0 = sp.Matrix([
    sp.Rational(4,10),
    sp.Rational(2,10),
    sp.Rational(4,10)
])

# Printando como float para ficar mais bonito
sp.pprint(A.evalf())
sp.pprint(x_0.evalf())


x_0b = sp.Matrix([0,
                  0,
                  1
])

# Printando como float para ficar mais bonito
print('A=')
sp.pprint(A.evalf())
print('\nx_0 =')
sp.pprint(x_0b)

# Para m = 2 faremos
x2b = A**2*x_0b

print('x2 = ')
sp.pprint(sp.N(x2b, 7))

A100 = A**100
sp.pprint(sp.N(A100, 7))


# Imaginemos um vetor y inicial
y_0b = sp.Matrix([0.1,
                  0.2,
                  0.7
])

A100c = A**100*y_0b
sp.pprint(sp.N(A100c, 7))
