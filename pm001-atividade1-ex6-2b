# ==============================================================================
# DISCIPLINA: PM001 - Matemática Computacional
# ATIVIDADE 1 - Exercício 6 - 2b
# Descrição: Área de Polígonos (Fórmula do Cadarço / Teorema do Agrimensor)
# ==============================================================================

println("⏳ Preparando o ambiente... (Instalando dependências se necessário)")

# ------------------------------------------------------------------------------
# VERIFICAÇÃO E INSTALAÇÃO AUTOMÁTICA DE PACOTES
# ------------------------------------------------------------------------------
import Pkg
if !haskey(Pkg.project().dependencies, "Plots")
    println("▶ O pacote 'Plots' não foi encontrado. Instalando automaticamente...")
    Pkg.add("Plots")
end
# ------------------------------------------------------------------------------

using Plots
using LinearAlgebra

println("✅ Ambiente pronto. Calculando a área da região poligonal...\n")

# 1. Definindo os vértices no sentido anti-horário
# V1=(1,1), V2=(4,1), V3=(3,4), V4=(0,3)
vertices = [(1.0, 1.0), (4.0, 1.0), (3.0, 4.0), (0.0, 3.0)]
n = length(vertices)

# 2. --- Cálculo da Área via Determinantes ---
soma_determinantes = 0.0

println("--- Memória de Cálculo ---")
for i in 1:n
    # O operador % (módulo) faz o índice "dar a volta" (conecta o V4 de volta ao V1)
    j = (i % n) + 1 
    
    # Montando a matriz 2x2 com as coordenadas dos pontos consecutivos
    matriz = [vertices[i][1]  vertices[j][1];
              vertices[i][2]  vertices[j][2]]
              
    det_atual = det(matriz)    
    
    global soma_determinantes += det_atual
    
    println("Determinante D$i (V$i e V$j) = ", det_atual)
end

area_total = soma_determinantes / 2
println("-"^26)
println("Soma dos determinantes = ", soma_determinantes)
println("ÁREA TOTAL (Soma / 2)  = ", area_total, " unidades de área")
println("--------------------------\n")

# 3. --- Visualização Gráfica ---
# Separando X e Y e "fechando" o polígono adicionando o primeiro ponto ao final
X = [v[1] for v in vertices]
push!(X, vertices[1][1])

Y = [v[2] for v in vertices]
push!(Y, vertices[1][2])

# Desenhando o polígono preenchido
grafico = plot(X, Y, fill=(0, 0.2, :blue), linewidth=2, color=:blue,
               label="Área = $area_total", title="Região Poligonal (Item 2b)",
               xlabel="Eixo X", ylabel="Eixo Y", aspect_ratio=:equal,
               xlims=(-1, 5), ylims=(0, 5), grid=true, legend=:bottomright)

# Marcando os vértices de vermelho
scatter!(grafico, X, Y, color=:red, markersize=5, label="Vértices")

# Exibindo o gráfico
display(grafico)
println("✅ Gráfico gerado com sucesso!")
