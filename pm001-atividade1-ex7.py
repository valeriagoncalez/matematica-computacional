# Montando a matriz respeitando as restrições
A = sp.Matrix([
    [4, 2, 0, 2],
    [1, 1, 1, 1],
    [1, 2, 0, 0],
    [1, 1, 0, 0]
])

# Vendo em qual número devemos chegar
detA = A.det()
print(f'Determinante da matriz é {detA}')


# Criando lista de permutacõe
lista_permu = list(permutations([1,2,3, 4]))
print(f'A lista de permutaçoes é \n {lista_permu}')

# Definindo função para inversões
def inversao(p):
  J = 0
  for i in range(len(p)):
    for j in range(i + 1, len(p)):
      if p[i] > p[j]:
        J+=1
  return J

soma_termo = 0
for p in lista_permu:
  J = inversao(p)
  sinal = (-1)**J
  # Coleta elemento da matriz A e multiplica
  produto = 1
  for i in range(4):
    produto *= A[i,p[i] -1]

  soma_termo += sinal*produto

det_permut = soma_termo
print(f'O determinante via permutações é {det_permut}')
print(f'Ele é igual ao determinante calculado pelo sympy? {detA==det_permut}')

# Obtendo as sub matrizes
M11 = A.minor_submatrix(0,0)
M12 = A.minor_submatrix(0,1)
M13 = A.minor_submatrix(0,2)
M14 = A.minor_submatrix(0,3)

sp.pprint(M11)
sp.pprint(M12)
sp.pprint(M13)
sp.pprint(M14)

# Obtendo seus determinantes
detM11 = M11.det()
detM12 = M12.det()
detM13 = M13.det()
detM14 = M14.det()

print(f'Os determinantes dos Cofatores (sem sinal) \n são respectivamente {detM11}, {detM12}, {detM13}, {detM14}')

print("Pelo desenvolvimento de Laplace na primeira linha:")
print(f"det(A) = 4*det(M11) - 2*det(M12) + 0*det(M13) - 2*det(M14)")
print(f"det(A) = 4*({detM11}) - 2*({detM12}) - 2*({detM14})")
print(f"det(A) = {4*detM11 - 2*detM12 - 2*detM14}")

print("Pelo desenvolvimento de Laplace na primeira linha:")
print(f"det(A) = 4*det(M11) - 2*det(M12) + 0*det(M13) - 2*det(M14)")
print(f"det(A) = 4*({detM11}) - 2*({detM12}) - 2*({detM14})")
print(f"det(A) = {4*detM11 - 2*detM12 - 2*detM14}")

# Percorrend todos os pares de colunas J
for J in pares_col:
    # Colunas complementares: as que não estão em J
    Jc = [c for c in [1, 2, 3, 4] if c not in J]

    # Menor 2x2 formado pelas linhas 1 e 2 e colunas J
    menor_superior = A.extract([0, 1], [J[0]-1, J[1]-1])

    # Menor complementar 2x2 formado pelas linhas 3 e 4 e colunas complementares Jc
    menor_complementar = A.extract([2, 3], [Jc[0]-1, Jc[1]-1])

    print(f"J = {J}, Jc = {tuple(Jc)}")
    print("Menor das linhas 1 e 2:")
    sp.pprint(menor_superior)
    print("Menor complementar das linhas 3 e 4:")
    sp.pprint(menor_complementar)

# Calculando determinant3s
for J in pares_col:
    # Colunas complementares Jc
    Jc = [c for c in [1, 2, 3, 4] if c not in J]

    # Menor complementar: linhas 3 e 4, colunas Jc
    menor_complementar = A.extract([2, 3], [Jc[0]-1, Jc[1]-1])
    print(f"J = {J}, Jc = {tuple(Jc)}, det(complementar) = {menor_complementar.det()}")

# Escolhend o  único par com det nao nulo
J = (3, 4)
Jc = [c for c in [1, 2, 3, 4] if c not in J]

# Menor 2x2 das linhas 1 e 2 com colunas 3 e 4
menor_superior = A.extract([0, 1], [J[0]-1, J[1]-1])

# Menor complementar 2x2 das linhas 3 e 4 com colunas 1 e 2
menor_complementar = A.extract([2, 3], [Jc[0]-1, Jc[1]-1])

sp.pprint(menor_superior)
sp.pprint(menor_complementar)

# Determinante do menor das linhas 1 e 2 com colunas 3 e 4
det_sup = menor_superior.det()

# Determinante do menor complementar das linhas 3 e 4 com colunas 1 e 2
det_comp = menor_complementar.det()

sinal = (-1)**(1 + 2 + 3 + 4)
det_generalizado = sinal * det_sup * det_comp

print(f'Resultado final = {det_generalizado}')
