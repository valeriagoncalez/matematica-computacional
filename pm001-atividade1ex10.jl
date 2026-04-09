# ==============================================================================
# DISCIPLINA: PM001 - Matemática Computacional
# ATIVIDADE: Exercício 10 - Criptografia com Matrizes 4x4
# ==============================================================================

println("⏳ Preparando o ambiente seguro... (Isso pode levar alguns segundos)")

# ------------------------------------------------------------------------------
# VERIFICAÇÃO E INSTALAÇÃO AUTOMÁTICA DE PACOTES (Padrão Colab)
# ------------------------------------------------------------------------------
import Pkg
# O LinearAlgebra é nativo, mas o Plots precisa ser verificado
if !haskey(Pkg.project().dependencies, "Plots")
    println("▶ O pacote 'Plots' não foi encontrado. Instalando automaticamente...")
    Pkg.add("Plots")
end
# ------------------------------------------------------------------------------

using LinearAlgebra
using Plots

println("✅ Ambiente pronto. Iniciando o sistema de criptografia...\n")
println("--- SISTEMA DE CRIPTOGRAFIA MATRICIAL ---")

# 1. Definição da Matriz Chave 4x4 (det = 1)
K = [1.0  1.0  0.0  0.0;
     0.0  1.0  1.0  0.0;
     0.0  0.0  1.0  1.0;
     0.0  0.0  0.0  1.0]

println("▶ Matriz Chave (K):")
display(K)
println("Determinante de K = ", det(K), " (Possui inversa!)\n")

# 2. Mensagem Original (Convertida para Matriz 4x4)
# Mensagem: "ESTUDO MATRIZES "
M = [ 5.0  18.0  19.0  20.0;
      4.0  14.0   0.0  12.0;
      1.0  19.0  17.0   9.0;
     25.0   5.0  18.0   0.0]

println("▶ Matriz da Mensagem Original (M):")
display(M)

# 3. Processo de CODIFICAÇÃO (M * K)
M_codificada = M * K
println("\n▶ Mensagem CODIFICADA enviada (Matriz M * K):")
display(M_codificada)

# 4. Processo de DECODIFICAÇÃO (M_codificada * Inversa de K)
K_inversa = inv(K)
M_decodificada = round.(M_codificada * K_inversa) 

println("\n▶ Mensagem DECODIFICADA no destino:")
display(M_decodificada)

# 5. --- Visualização Gráfica  ---
println("\nGerando os gráficos de calor (Heatmaps)...")

function gerar_heatmap_anotado(matriz, titulo, cor)
    # 1. Cria o fundo do mapa de calor
    mapa = heatmap(matriz, yflip=true, color=cor, title=titulo, 
                   colorbar=false, aspect_ratio=:equal, 
                   xticks=false, yticks=false, framestyle=:none)
    
    # 2. Varre a matriz colocando os números no centro de cada célula
    for linha in axes(matriz, 1)
        for coluna in axes(matriz, 2)
            valor = Int(round(matriz[linha, coluna]))
            # Adiciona o texto na coordenada (X=coluna, Y=linha)
            annotate!(mapa, coluna, linha, text(string(valor), 10, :black, :center))
        end
    end
    return mapa
end

# Gerando os 3 mapas individualmente
mapa_original = gerar_heatmap_anotado(M, "Mensagem Original", :Greens)
mapa_codificado = gerar_heatmap_anotado(M_codificada, "Mensagem Cifrada", :Reds)
mapa_decodificado = gerar_heatmap_anotado(M_decodificada, "Decodificada", :Greens)

# Juntando tudo em uma imagem só
grafico_final = plot(mapa_original, mapa_codificado, mapa_decodificado, 
                     layout=(1,3), size=(900, 300))


display(grafico_final)

# Validação Final
if M_decodificada == M
    println("\n✅ SUCESSO! A álgebra linear garantiu a segurança e a tradução da mensagem.")
else
    println("\n❌ ERRO na decodificação.")
end
