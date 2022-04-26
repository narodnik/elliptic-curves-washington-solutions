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


