K = GF(7)
E = EllipticCurve(K, [0, 2])

# We are computing:
#   e3((0, 3), (5, 1))

S = E(0, 3)
T = E(5, 1)
assert S.order() == T.order() == 3

inf = E(0)

# Divisor functions
def dsum(D):
    P = inf
    for order, pnt in D:
        P += order * pnt
    return P

def degree(D):
    return sum(order for order, _ in D)

def neg(D):
    return tuple((-order, pnt) for order, pnt in D)

D_S = ((1, S), (-1, inf))
assert dsum(D_S) == S

R = E.random_point()
D_T = ((1, T + R), (-1, R))
assert dsum(D_T) == T

