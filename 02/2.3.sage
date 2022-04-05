# y^2 = x^3 + 73
A = QQ(0)
B = QQ(73)

# P
x_1 = QQ(2)
y_1 = QQ(9)

# Q
x_2 = QQ(3)
y_2 = QQ(10)

# R
x_3 = QQ(-4)
y_3 = QQ(-3)

E = EllipticCurve(QQ, [A, B])
P = E(2, 9)
Q = E(3, 10)
R = E(-4, -3)
PQ = P + Q
PQR = PQ + R
QR = Q + R
assert P + QR == PQR

# P + Q
m = (y_2 - y_1) / (x_2 - x_1)
x = m^2 - x_1 - x_2
y = m * (x_1 - x) - y_1
assert x == PQ[0]
assert y == PQ[1]

# Lets try the other method we worked out in 2.1
x_alt = ((y_1 - m * x_1)^2 - B) / (x_1 * x_2)
# It also works!
assert x_alt == x

# Now we add R
# but x_3 == x_4 so use point doubling instead
assert x_3 == x
m = (3 * x^2 + A) / (2 * y)
x = m^2 - 2 * x
assert x == PQR[0]

# Part b
# Compute Q + R
m = (y_3 - y_2) / (x_3 - x_2)
x = m^2 - x_3 - x_2
y = m * (x_2 - x) - y_2
assert x == QR[0]
assert y == QR[1]

# Now add P
m = (y - y_1) / (x - x_1)
x = m^2 - x_1 - x
assert x == PQR[0]

