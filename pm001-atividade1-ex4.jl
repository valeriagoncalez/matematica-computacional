# ==============================================================================
# DISCIPLINA: PM001 - Matemática Computacional
# ATIVIDADE: Exercício 4 da Lista de Atividades
# DESCRIÇÃO: Reflexão no plano em relação à reta y = -kx (k = 8)
#            utilizando o produto de 3 matrizes (H = R_theta * M * R_-theta).
# ==============================================================================

using LinearAlgebra

# 1. Definição do parâmetro k (maior algarismo do RA: 324185)
k = 8

# 2. Cálculo dos componentes trigonométricos
# Para a reta y = -8x, temos tan(theta) = -8. 
# Hipotenusa = sqrt(1^2 + (-8)^2) = sqrt(65)
hip = sqrt(1 + k^2)
cos_th = 1 / hip
sin_th = -k / hip

# 3. Definição das 3 Matrizes Elementares
# Rotação Inversa (deita a reta sobre o eixo x)
R_inv = [cos_th  sin_th; 
        -sin_th  cos_th]

# Matriz de Reflexão em relação ao eixo x
M = [1  0; 
     0 -1]

# Rotação de Retorno (volta para a inclinação original)
R_theta = [cos_th  -sin_th; 
           sin_th   cos_th]

# 4. Cálculo da Transformação Final (Produto das 3 Matrizes)
# De acordo com o enunciado: Transformação = Produto de 3 matrizes
H = R_theta * M * R_inv

println("--- Disciplina PM001 - Exercício 4 ---")
println("Matriz de Reflexão Final (H):")
display(H)

# 5. Teste Prático
# Vamos refletir um ponto P(1, 1) para verificar o efeito geométrico
ponto_original = [1.0, 1.0]
ponto_refletido = H * ponto_original

println("\nTeste de Reflexão:")
println("Ponto Original: ", ponto_original)
println("Ponto Refletido: ", ponto_refletido)

# ==============================================================================
# FIM DO SCRIPT
# ==============================================================================
