# ==============================================================================
# Disciplina: PM001 - Mestrado em Matemática Computacional (Unicamp)
# Objetivo: Obtenção da matriz na forma escalonada reduzida por linhas utilizando
# a linguagem Julia, garantindo precisão absoluta via aritmética de racionais.
# ==============================================================================

# 1. Gerenciamento de Dependências
# Instalação e importação do pacote RowEchelon, que fornece a implementação 
# do algoritmo para cálculo da matriz reduzida à forma escada (RREF).
# import Pkg; Pkg.add("RowEchelon") # Descomentar apenas na primeira execução do ambiente
using RowEchelon

# 2. Instanciação da Matriz Ampliada
# A matriz A é definida utilizando o tipo estruturado Rational da linguagem Julia (denotado por //).
# A adoção de aritmética exata (racionais) em detrimento da representação em ponto flutuante (Float64)
# é adotada como estratégia para mitigar a propagação de erros de truncamento e arredondamento 
# inerentes às operações sucessivas de divisão durante o processo de pivoteamento.

A = [3//1  2//1  4//1  1//1   8//1  5//1;
     1//1  1//1  1//1  1//1   1//1  1//1;
     1//1 -1//1  1//1 -1//1   1//1 -1//1;
     5//1  2//1  6//1  1//1  10//1  5//1]

println("Matriz Ampliada Original (A):")
display(A)
println("\n")

# 3. Redução por Operações Elementares de Linha
# Aplicação da função rref (Reduced Row Echelon Form) para executar o método 
# de eliminação de Gauss-Jordan e obter a matriz canônica equivalente por linhas.
matriz_reduzida = rref(A)

println("Matriz na Forma Escalonada Reduzida por Linhas (RREF):")
display(matriz_reduzida)
