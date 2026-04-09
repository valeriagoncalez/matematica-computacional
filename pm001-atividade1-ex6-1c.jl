# ==============================================================================
# DISCIPLINA: PM001 - Matemática Computacional
# ATIVIDADE: Exercício 6 da Lista 1 de Atividades
# DESCRIÇÃO: Lista Determinantes - 1C (Interpolação de Vandermonde)
# ==============================================================================

println("⏳ Preparando o ambiente... (Isso pode levar alguns segundos na primeira vez)")

# ------------------------------------------------------------------------------
# VERIFICAÇÃO E INSTALAÇÃO AUTOMÁTICA DE PACOTES
# Este bloco garante que a professora (ou qualquer usuário) conseguirá 
# rodar o código sem se preocupar em instalar dependências manualmente.
# ------------------------------------------------------------------------------
import Pkg
# Verifica se o pacote Plots está instalado; se não estiver, instala.
if !haskey(Pkg.project().dependencies, "Plots")
    println("▶ O pacote 'Plots' não foi encontrado. Instalando automaticamente...")
    Pkg.add("Plots")
end
# ------------------------------------------------------------------------------

using LinearAlgebra
using Plots

println("✅ Ambiente pronto. Gerando os polinômios e os gráficos...\n")

# Função que encapsula a lógica: recebe os pontos, resolve e retorna o gráfico
function interpolacao_vandermonde(pontos, titulo)
    # Extraindo vetores X e Y (garantindo que sejam Float64 para precisão)
    X = Float64[p[1] for p in pontos]
    Y = Float64[p[2] for p in pontos]
    
    # O grau do polinômio é o número de pontos menos 1
    n = length(pontos) - 1
    
    # 1. Montagem da Matriz de Vandermonde
    # Usamos uma "comprehension" para elevar cada x à potência j
    V = [x^j for x in X, j in 0:n]
    
    # 2. Resolução do Sistema Linear (V * C = Y)
    # Em Julia, o operador '\' resolve o sistema linear diretamente
    C = V \ Y
    
    # 3. Construção da função polinomial
    # A função evalpoly avalia polinômios de forma otimizada
    P(x) = evalpoly(x, C)
    
    # --- Impressão dos resultados no terminal ---
    println("▶ ", titulo)
    println("Matriz de Vandermonde (V):")
    display(round.(V, digits=2))
    println("Vetor de Coeficientes (C):")
    display(round.(C, digits=4))
    println("-"^40)
    
    # 4. Desenho do Gráfico
    # Criamos um intervalo de x com uma "sobra" para o gráfico ficar bonito
    x_plot = range(minimum(X) - 0.5, maximum(X) + 0.5, length=100)
    y_plot = P.(x_plot) # O ponto '.' aplica a função a todo o vetor
    
    # Plotando a curva do polinômio
    grafico = plot(x_plot, y_plot, label="P(x) - Grau $n", 
                   linewidth=2, color=:blue, title=titulo,
                   xlabel="x", ylabel="y", legend=:bottomright)
                   
    # Sobrepondo os pontos originais
    scatter!(grafico, X, Y, label="Pontos Dados", 
             color=:red, markersize=5, markerstrokewidth=0)
             
    return grafico
end

# ==============================================================================
# Definindo os conjuntos de pontos para os "Graus Variados"
# ==============================================================================

# Grau 1 (Reta): 2 pontos
pontos_g1 = [(0.0, 1.0), (2.0, 5.0)]

# Grau 2 (Parábola): 3 pontos
pontos_g2 = [(-1.0, 0.0), (0.0, 1.0), (1.0, 0.0)]

# Grau 3 (Cúbica): 4 pontos
pontos_g3 = [(-1.0, -1.0), (0.0, 1.0), (1.0, 1.0), (2.0, 5.0)]

# ==============================================================================
# Execução
# ==============================================================================

g1 = interpolacao_vandermonde(pontos_g1, "Grau 1: Linear")
g2 = interpolacao_vandermonde(pontos_g2, "Grau 2: Quadratico")
g3 = interpolacao_vandermonde(pontos_g3, "Grau 3: Cubico")

# Exibindo todos os gráficos lado a lado em uma única janela
grafico_final = plot(g1, g2, g3, layout=(1, 3), size=(1000, 350), margin=5Plots.mm)

display(grafico_final)
println("✅ Gráficos gerados com sucesso!")
