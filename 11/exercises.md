---
header-includes: |
    - \usepackage{mathrsfs}
    - \usepackage{mathtools}
    - \usepackage{extpfeil}
    - \DeclareMathOperator\char{char}
    - \DeclareMathOperator\div{div}
    - \DeclareMathOperator\deg{deg}
    - \DeclareMathOperator\dsum{sum}
    - \DeclareMathOperator\supp{supp}
---

# 11.1

## a

```python
sage: R.<x, y> = QQ[]
sage: I = ideal(y^2 - x^3 - x, y^4 + 1)
sage: I.variety()
[]
sage: J = ideal(y^2 - x^3 - x, x^2 + 1)
sage: J.variety()
[]
```

We can also just note that $(x^3 - x)^4 + 1 = 0$ is impossible in $\mathbb{Q}$.

## b

```python
sage: I = ideal(y^2 - x^3 - x, y^4)
sage: I.variety()
[{y: 0, x: 0}]
```

## c

$x^3 - x = a$ for some $a$ has 3 solutions, but there are 4 possible values for $y$, so total solutions
are 12.

```python
sage: R.<x, y> = QQbar[]
sage: I = ideal(y^2 - x^3 + x, y^4 + 1)
sage: I.variety()
[{y: -0.7071067811865475? - 0.7071067811865475?*I, x: -1.161541399997252? + 0.3411639019140097?*I},
 {y: -0.7071067811865475? - 0.7071067811865475?*I, x: 0.?e-19 - 0.6823278038280193?*I},
 {y: -0.7071067811865475? - 0.7071067811865475?*I, x: 1.161541399997252? + 0.3411639019140097?*I},
 {y: -0.7071067811865475? + 0.7071067811865475?*I, x: -1.161541399997252? - 0.3411639019140097?*I},
 {y: -0.7071067811865475? + 0.7071067811865475?*I, x: 0.?e-19 + 0.6823278038280193?*I},
 {y: -0.7071067811865475? + 0.7071067811865475?*I, x: 1.161541399997252? - 0.3411639019140097?*I},
 {y: 0.7071067811865475? - 0.7071067811865475?*I, x: -1.161541399997252? - 0.3411639019140097?*I},
 {y: 0.7071067811865475? - 0.7071067811865475?*I, x: 0.?e-19 + 0.6823278038280193?*I},
 {y: 0.7071067811865475? - 0.7071067811865475?*I, x: 1.161541399997252? - 0.3411639019140097?*I},
 {y: 0.7071067811865475? + 0.7071067811865475?*I, x: -1.161541399997252? + 0.3411639019140097?*I},
 {y: 0.7071067811865475? + 0.7071067811865475?*I, x: 0.?e-19 - 0.6823278038280193?*I},
 {y: 0.7071067811865475? + 0.7071067811865475?*I, x: 1.161541399997252? + 0.3411639019140097?*I}]
```

$y^2 = x^3 - x = x(x^2 - 1)$. But $(x^2 + 1)^3 \implies x^2 = -1 \implies y^2 = 0 \implies y = 0$.
So $y$ is fixed, and there are 2 values for $x = i, -i$.

```python
sage: I = ideal(y^2 - x^3 + x, (x^2 + 1)^3)
sage: I.variety()
[{y: 1 - 1*I, x: 1*I},
 {y: 1 + 1*I, x: -1*I},
 {y: -1 - 1*I, x: -1*I},
 {y: -1 + 1*I, x: 1*I}]
```

```python
# Try to find gradient at P = (i, 1 - i) for C and f
sage: x = I
sage: y = 1 - I
sage: y^2 == x^3 - x
True
sage: (3*x^2 - 1)/(2*y)
-I - 1
sage: (x^2 + 1)^3
0
sage: var("X Y")
(X, Y)
sage: diff(((X^2 + 1)^3).expand())(X=x)
0
```

Lets look at $(y^4 + 1)$. There are 4 possible values for $y$, and for each $y$, there are 3 possible
values for $x$. Essentially we can look at $\div{(y^4 + 1)} = \div{(\prod (y - y_i))}$.

Let $y = \pm \frac{\sqrt{2}}{2} \pm \frac{\sqrt{2}}{2}$ and $x$ by the solutions for $y^2 = x^3 - x$ giving us 12 points. Then $\div{(y - y_i)} = [P_1] + [P_2] + [P_3] - 3[\infty]$. Adding them up should give us a divisor with 12 unique points total.
By Bezout's these all have multiplicity of 1.

|         Px         |         Py         |
|--------------------|--------------------|
|-0.00000 + -0.68233i|-0.70711 + -0.70711i|
| -1.16154 + 0.34116i|-0.70711 + -0.70711i|
| 1.16154 + 0.34116i |-0.70711 + -0.70711i|
| -0.00000 + 0.68233i| -0.70711 + 0.70711i|
|-1.16154 + -0.34116i| -0.70711 + 0.70711i|
| 1.16154 + -0.34116i| -0.70711 + 0.70711i|
| -0.00000 + 0.68233i| 0.70711 + -0.70711i|
|-1.16154 + -0.34116i| 0.70711 + -0.70711i|
| 1.16154 + -0.34116i| 0.70711 + -0.70711i|
|-0.00000 + -0.68233i| 0.70711 + 0.70711i |
| -1.16154 + 0.34116i| 0.70711 + 0.70711i |
| 1.16154 + 0.34116i | 0.70711 + 0.70711i |

For the denominator, note that
$$(x^2 + 1) = (x - i)(x + i)$$
Giving us 4 values total (since $y^2 = x^3 - x$). Each one of these factors is a vertical line
that cuts in $+y, -y$, giving us the divisor
$$\textrm{div}(x^2 + 1) = [(i, 1 - i)] + [(i, -1 + i)] + [(-i, 1 + i)] + [(-i, -1 - i)] - 4[\infty]$$
$$\textrm{div}((x^2 + 1)^3) = 3[(i, 1 - i)] + 3[(i, -1 + i)] + 3[(-i, 1 + i)] + 3[(-i, -1 - i)] - 12[\infty]$$

Lastly for $g$, we look at $y^4 = 0 \implies y = 0$ and get 2 points $x = \pm 1, y = 0$.

$$\div(y^4) = 4 \div(y) = 4[(1, 0)] + 4[(-1, 0)] - 8[\infty]$$

# 11.2

$e_{mn}(S, T)$ corresponds to $g(P + S)^{mn} = g(mP + mS)^n$, but $mS \in E[n]$ and
$e_n(mS, T)$ corresponds to $g(Q + mS)^n$. Both pairings are independent of $P$ and $Q$ chosen
so they are the same.

# 11.3

$\mathbb{P}^1$ corresponds to 
