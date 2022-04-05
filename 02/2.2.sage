# y^2 = x^3 - 2
x_1 = QQ(3)
y_1 = QQ(5)
assert y_1^2 == x_1^3 - 2

A = QQ(0)
B = QQ(-2)

m = (3 * x_1^2 + A) / (2 * y_1)
x_3 = m^2 - 2 * x_1
y_3 = m * (x_1 - x_3) - y_1
print(x_3, y_3)

# Now lets verify this is correct
E = EllipticCurve(QQ, [A, B])
P_1 = E(x_1, y_1)
P_3 = 2 * P_1
print(P_3)

assert P_3[0] == x_3
assert P_3[1] == y_3

