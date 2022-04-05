E = EllipticCurve(QQ, [-34, 37])
P = E(1, 2)
Q = E(6, 7)

PP = 2 * P
PQ = P + Q

F = EllipticCurve(Integers(5), [-34, 37])
PP_F = F(PP[0], PP[1])
PQ_F = F(PQ[0], PQ[1])
assert PP_F == PQ_F

