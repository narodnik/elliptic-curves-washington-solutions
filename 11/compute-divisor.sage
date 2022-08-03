# pip install py-markdown-table
from markdownTable import markdownTable as MarkdownTable

#     (y⁴ + 1)     ∏ (y - yᵢ)
# f = -------- = --------------
#     (x² + 1)   (x - i)(x + i)
#
# where
#
#   yᵢ = ±1, ±i

var("x y")
y_prod = 1
y_values = []
for i in range(2):
    for j in range(2):
        sign_1 = 2*i - 1
        sign_2 = 2*j - 1
        y_i = sqrt(2)/2*(sign_1 + sign_2*I)
        y_factor = y - y_i
        y_prod *= y_factor
        y_values.append(y_i)
assert y_prod == y^4 + 1

points = []
for y_i in y_values:
    x_vals = solve(y_i^2 - (x^3 - x), x)
    x_vals = [x_i.rhs() for x_i in x_vals]
    for x_i in x_vals:
        m = (3*x_i^2 - 1) / (2*y_i)
        # The gradient of any (y - yᵢ) is 0
        assert m != 0
        points.append((x_i, y_i))

table = []
divisor = ""
for (Px, Py) in points:
    Px_re, Px_im = Px.n().real(), Px.n().imag()
    Py_re, Py_im = Py.n().real(), Py.n().imag()
    table.append({
        "Px": f"{Px_re:.5f} + {Px_im:.5f}i",
        "Py": f"{Py_re:.5f} + {Py_im:.5f}i"
    })
print(MarkdownTable(table).setParams(row_sep="markdown").getMarkdown())

# Now lets look at x^2 + 1
for x_i in [I, -I]:
    y_vals = solve(y^2 - (x_i^3 - x_i), y)
    y_vals = [y_i.rhs() for y_i in y_vals]
    for y_i in y_vals:
        # Since each linear factor is monomial, it's gradient is inf
        # We just have to check y_i is nonzero => m != inf
        assert y_i != 0
        # This will intersect the curve in 2 places at +y and -y

