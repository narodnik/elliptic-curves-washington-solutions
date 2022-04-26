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

