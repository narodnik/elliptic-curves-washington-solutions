c, d = var("c d")

def add(u_1, v_1, u_2, v_2):
    x = (u_1 * v_2 + u_2 * v_1) / (c * (1 + d * u_1 * u_2 * v_1 * v_2))
    y = (v_1 * v_2 - u_1 * u_2) / (c * (1 - d * u_1 * u_2 * v_1 * v_2))
    return x.expand(), y.expand()

# identity point
e = (0, c)

# add point to itself 4 times
# as noted in text, we don't have separate formulas for 2P
P = add(c, 0, c, 0)
P = add(c, 0, P[0], P[1])
x, y = add(c, 0, P[0], P[1])
assert (x, y) == e

