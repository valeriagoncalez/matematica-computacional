import sympy as sp
import matplotlib.pyplot as plt
import numpy as np
from itertools import permutations, combinations

# Escrevendo minha matriz
M = sp.Matrix([[100, 50, 0],
            [30, 30, 30],
            [260, 160, 60]])
# Definindo vertor dos termos independentes
b = sp.Matrix([[2000],
            [1500],
            [7000]])

# Printando
sp.pprint(M)
sp.pprint(b)

# Criando as incognitas do meu problema
x, y, z = sp.symbols('x y z', integer=True)

# Pedindo a solução
sol = sp.linsolve((M,b),(x, y, z))
sol

# Definindo parâmetro t
t = sp.symbols('t', integer=True)
x_t = t - 10
y_t = 60 - 2*t
z_t = t

# Gerando o conjunto de soluções naturais
sol_N = []
for valor in range(10,31):
  sol_N.append((x_t.subs(t, valor),
                y_t.subs(t, valor),
                z_t.subs(t, valor)))
print(f'Existem {len(sol_N)} soluções:')
print(sol_N)

# Separando ax coordenadas
xs = [p[0] for p in sol_N]
ys = [p[1] for p in sol_N]
zs = [p[2] for p in sol_N]


# Defindo a solução em Reais
t_real = np.linspace(5,35,200)
x_real = t_real - 10
y_real = 60 - 2*t_real
z_real = t_real

# Plotando
fig = plt.figure(figsize=(8,6))
ax = fig.add_subplot(111, projection='3d')
ax.plot(x_real, y_real, z_real, label='Solução em Reais')
ax.scatter([float(xs[i]) for i in range(len(xs))],
           [float(ys[i]) for i in range(len(ys))],
           [float(zs[i]) for i in range(len(zs))],
           label='Solução em Reais Naturais')
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')
ax.set_xlim(-1, 16)
ax.set_ylim(-1, 41)
ax.set_zlim(-1,26)

ax.set_box_aspect((21, 25, 22))
plt.show()

x_plane = np.linspace(0, 20, 30)
y_plane = np.linspace(0, 40, 30)
z_plane = np.linspace(0, 30, 30)

X, Y = np.meshgrid(x_plane, y_plane)
X, Z = np.meshgrid(x_plane, z_plane)

Z1 = 50 - X - Y # plano 2: z = 50 - x - y
Y1 = 40 - 2*X   # plano 1: y = 40 - 2x

fig = plt.figure(figsize=(9, 7))
ax = fig.add_subplot(111, projection='3d')

# plano 1: 100x + 50y = 2000  ->  y = 40 - 2x
ax.plot_surface(X, Y1, Z, alpha=0.35)

# plano 2: 30x + 30y + 30z = 1500  ->  z = 50 - x - y
ax.plot_surface(X, Y, Z1, alpha=0.35)

# reta da solução geral
ax.plot(x_real, y_real, z_real, label='Solução Geral Associada')

# soluções naturais
ax.scatter([float(xs[i]) for i in range(len(xs))],
           [float(ys[i]) for i in range(len(ys))],
           [float(zs[i]) for i in range(len(zs))],
           label='Solução em Naturais')

ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')

ax.set_xlim(-1, 41)
ax.set_ylim(-1, 41)
ax.set_zlim(-1, 56)

ax.set_box_aspect((21, 41, 31))
ax.view_init(elev=20, azim=-20)
#ax.grid(False)
plt.legend()
plt.show()
