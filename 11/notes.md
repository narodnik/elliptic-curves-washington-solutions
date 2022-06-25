---
header-includes: |
    - \usepackage{mathrsfs}
    - \usepackage{mathtools}
    - \usepackage{extpfeil}
    - \DeclareMathOperator\char{char}
    - \DeclareMathOperator\div{div}
    - \DeclareMathOperator\deg{deg}
    - \DeclareMathOperator\dsum{sum}
---

# Order of Vanishing and Intersection Multiplicity

Order of vanishing simply means the intersection multiplicity of a point that when evaluated
on E is zero or a pole.

# Divisors

$$f(x) = (x - a)^3 (x - b)^5$$
$$\div(f) = 3[a] + 5[b] - 8[\infty]$$

# Weil Pairing

$$n \mid \char(K)$$

There exists $f$ such that
$$\div(f) = n[T] - n[\infty]$$
because by theorem 11.2, $\deg(D) = 0, \dsum(D) = \infty \implies \exists f : \div(f) = D$.

Likewise for
\begin{align*}
\div(g) &= \sum_{R \in E[n]} ([T' + R] - [R]) \\
        &= \sum_{R \in E[n]} [T' + R] - \sum_{nR = \infty} [R]
\end{align*}

Now we want to show that given an $T' \in E[n^2]$ such that $nT' = T$ then
$$\{ T'' : nT'' = T \} = \{ T' + R : R \in E[n] \}$$
This is equivalent to the statement that given any $T'' \in E[n^2]$ then
$$T'' = T' + R : R \in E[n]$$
$$\alpha: E[n^2] \rightarrow E[n]$$
$$\alpha(T'') = nT''$$
$$[E[n^2] : E[n]] = n^2$$
$$\ker \alpha = E[n]$$
$$T_1'', T_2'' \in E[n^2] : nT_1'' = nT_2'' = T \implies T_1'' \in T_2'' + E[n]$$
which proves the statement from before. Therefore
$$\sum_{R \in E[n]} [T' + R] = \sum_{nT'' = T} [T'']$$

Now given
$$\div(f) = n[T] - n[\infty]$$
We want to show that
$$\div(f \circ n) = n \left(\sum_{R \in E[n]} [T' + R]\right) - n \sum_{R \in E[n]} [R]$$

## Function Composition with Multiplication by n Map

See [here](https://math.stackexchange.com/questions/4478125/divisors-function-composition-with-multiplication-by-n-map-on-elliptic-curve)
and Silverman's Proposition II.2.6(c).
