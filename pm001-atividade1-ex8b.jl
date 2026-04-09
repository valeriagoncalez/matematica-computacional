# ==============================================================================
# DISCIPLINA: PM001 - Matemática Computacional
# ATIVIDADE: Exercício 8b - Paralelogramo Paramétrico no R³
# ==============================================================================

println("⏳ Preparando o ambiente 3D... (Instalando dependências se necessário)")

# ------------------------------------------------------------------------------
# VERIFICAÇÃO E INSTALAÇÃO AUTOMÁTICA DE PACOTES 
# ------------------------------------------------------------------------------
import Pkg
if !haskey(Pkg.project().dependencies, "Plots")
    println("▶ Instalando o pacote 'Plots'...")
    Pkg.add("Plots")
end
# ------------------------------------------------------------------------------

using Plots

println("✅ Ambiente pronto. Gerando o gráfico 3D...\n")

# 1. Definindo os vértices baseados no RA (324185)
# a=3, b=2, c=4 | d=1, e=8, f=5
O = [0.0, 0.0, 0.0]
P = [3.0, 2.0, 4.0]
Q = [1.0, 8.0, 5.0]

# O quarto vértice (R) é encontrado pela soma vetorial de P e Q
R = P + Q  # R = [4.0, 10.0, 9.0]

# 2. Organizando as coordenadas para o traçado do perímetro
# O caminho para fechar a figura é O -> P -> R -> Q -> O
X = [O[1], P[1], R[1], Q[1], O[1]]
Y = [O[2], P[2], R[2], Q[2], O[2]]
Z = [O[3], P[3], R[3], Q[3], O[3]]

# 3. Gerando o Gráfico 3D
grafico3D = plot(X, Y, Z, 
                 linewidth = 3, 
                 color = :blue, 
                 label = "Bordas do Paralelogramo",
                 title = "Paralelogramo Parametrizado (RA: 324185)",
                 xlabel = "Eixo X", 
                 ylabel = "Eixo Y", 
                 zlabel = "Eixo Z",
                 camera = (40, 30)) # Define o ângulo inicial de visão da câmera

# Adicionando pontos vermelhos nos vértices para destacar
scatter!(grafico3D, X, Y, Z, 
         color = :red, 
         markersize = 5, 
         label = "Vértices (O, P, Q, R)")

display(grafico3D)
println("✅ Gráfico 3D gerado com sucesso!")
