# 3.1

For b, we divide $x^4 - 1$ into linear factors and prove it shares no common
factors with the other poly divided by x.

```python
sage: R.<x> = PolynomialRing(Integers(5))
sage: (3x^4 + 2x).factor()
(3) * x * (x + 4) * (x^2 + x + 1)
sage: (x^5 - x).factor()
x * (x + 1) * (x + 2) * (x + 3) * (x + 4)
```

Note they also share $(x + 4)$.

## c

$x^5 - x$ contains all elements in $F_5$ as its roots.
$\phi_3$ sharing any factors with it, means that
$\phi_3$ will be zero at those values of $x$. When
$\phi_3$ is zero, then the point will be infinity.

We can see those values for $\phi_3$ are when $x = 0, 1$.
There is no corresponding $y \in K$ for $x = 1$, therefore the points are
$\{ \infty, (0, 1), (0, -1) \}$.

# 3.2

The formulas are degree 4 in $x$, which gives 2 roots in $y$ (based on the original EC formula).
Including the point at infinity there are 9 points and the isomorphic is self evident.

# 3.3

$$E[2] = \{ \infty, P_1, P_2, P_3 \}$$
$$e_2(P_i, P_j) = 1 : i \neq j$$
$$E[2] = 4 \implies E[2] \cong \mathbb{Z}_2 \times \mathbb{Z}_2$$
Since char $K \neq 2$, means they are coprime.
$$\implies \{ P_i, P_j \}$ is a basis of $E[2]$ and $e_2(P_i, P_j) = \omega_2 = -1$.

# 3.5

$$\deg \alpha = m^2$$
\begin{align*}
e(\alpha(P), \alpha(Q)) &= e(mP, mQ) \\
    &= e(\underbrace{P + \cdots + P}_m, mQ) \\
    &= e(P, mQ) \cdots e(P, mQ) \\
    &= [\underbrace{e(P, Q) \cdots e(P, Q)}_m] \cdots [e(P, Q) \cdots e(P, Q)] \\
    &= e(P, Q)^{m^2}
\end{align*}

# 3.6

\begin{align*}
e(P, kP) &= e(P, P + \cdots + P) \\
    &= e(P, P)^k = 1
\end{align*}

