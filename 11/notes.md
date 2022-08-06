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
    - \DeclareMathOperator\ord{ord}
    - \DeclareMathOperator\Hom{Hom}
    - \DeclareMathOperator\ker{ker}
    - \newcommand{\Pic}[1]{\operatorname{Pic}^0(#1)}
    - \newcommand{\Div}[1]{\operatorname{Div}^0(#1)}
    - \newcommand{\inf}{\infty}
---

# Order of Vanishing and Intersection Multiplicity

Order of vanishing simply means the intersection multiplicity of a point that when evaluated
on E is zero or a pole.

# Lemma 11.3

Let $P \neq Q$ and $\div{(h)} = [P] - [Q] \implies h(Q) = \infty \implies (h - c)(Q) = \infty$.
So there must also be one zero of $h - c$.

Let $f \in V(I) : f(Q) \neq 0, \infty$ then
$$\div{(g)} = \sum \textrm{ord}_R(f) [h(x, y) - h(R)]$$
remember that $\textrm{ord}_Q(f) = 0$

Let $P$ be a zero of $f$, then the factor in $\div{(g)}$ will be $n [h(x, y) - h(P)]$
so when $x, y = P$, then $h(x, y) - h(P) = 0$. Therefore $\div{(g)} = \div{(f)}$.
Therefore they are constant multiples of each other. We can simply adjust $f$ (or $g$) by multiplying
by a constant so that $f = g$.

Since $h(Q) = \infty$, then if $Q$ is a zero or pole of $f$ then that factor is undefined.
To illustrate this, assume $\textrm{ord}_Q(f) = 1$, then
$$f(P) = (h(P) - \infty)\cdots$$
Since $\infty - \infty$ is undefined, so $f(Q)$ is undefined.

Now lets look at $\textrm{ord}_Q(f) = n$. When $n > 0$, then
$$\div{(f)} = n[Q] + \cdots$$
$$\div{(h^n)} = -n[Q] + n[P]$$
$$\div{(f h^n)} = (n - n)[Q] + \cdots$$
which shows that $Q$ is not a zero or pole of $f h^n$.

When $n < 0$ then $f$ has a pole at $Q$ and
$$\div{(f)} = n[Q] + \cdots$$
$$\div{(f)} = -[Q] + [P]$$
$$\div{(h^n)} = -n[Q] + n[P]$$
$$\div{(f h^n)} = (n - n)[Q] + \cdots$$

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

$$P \rightarrow nP \rightarrow f(nP)$$
$T' + R$ generates the group of all $T'' : nT'' = T$.

$f(T) = 0 \implies f \circ n (T'') = 0$.

See [here](https://math.stackexchange.com/questions/4478125/divisors-function-composition-with-multiplication-by-n-map-on-elliptic-curve)
and Silverman's Proposition II.2.6(c).

Also import from Knapp's book page 316:
$$\textrm{ord}_x(f) = \textrm{ord}_{\psi(x)}(f \circ \psi^{-1})$$
Using this we see that
$$\textrm{ord}_{T'}(f \circ n) = \textrm{ord}_{nT'}(f \circ n \circ n^{-1})$$

# Tate Pairing

$\phi$ is the $q$th power Frobenius. Since $\phi(D) = D$, the points are pemuted without changing the divisor. Since the points satisfy $f(P)$, so $f \in \mathbb{F}_q[x, y]$, and hence $\phi(f) = f$.

# Computation of Pairings

## Calculating Divisors

$3D = 3[(0, 3)] - 3[\infty]$ is easy. We just use the horizontal line that cuts through $(0, 3)$. So $3D = \div(y - 3)$.

Sage code to see points of intersection with the curve:

```python
sage: R.<x, y> = PolynomialRing(GF(7))
sage: I = Ideal(y^2 - x^3 - 2, y - 3)
sage: I.variety()
[{y: 3, x: 0}]
```

As expected. We can also observe that the gradient of the line is 0, which is tangent to the curve at this point.

For the divisor
$$3D_{(5, 1)} = 3[(3, 6)] - 3[(6, 1)]$$
Observe that the tangent to the curve is calculated by
$$y' = \frac{3x^2}{2y}$$
So we see that $y'_{(3, 6)} = 4$ and that $y = 4x + 1$ is tangent to $(3, 6)$. Likewise $y'_{(6, 1)} = 5$ and $y = 5x - 1$ is tangent to $(6, 1)$
$$\implies \div\left(\frac{4x - y + 1}{5x - y - 1}\right) = 3[(3, 6)] - 3[(6, 1)]$$

## Miller Loop Divisors

$$D_j = j[P + R] - j[R] - [jP] - [\infty]$$
$$\div(ax + by + c) = [jP] + [kP] + [-(j + k)P] - 3[\infty]$$
$$\div(x + d) = [(j + k)P] + [-(j + k)P] - 2[\infty]$$
$$\div\left(\frac{ax + by + c}{x + d}\right) = [jP] + [kP] - [(j + k)P] - [\infty]$$
$$D_{j + k} = (j + k)[P + R] - (j + k)[R] - [(j + k)P] + [\infty]$$
\begin{align*}
D_j + D_k &= j[P + R] + k[P + R] - j[R] - k[R] - [jP] - [kP] + 2[\infty] \\
    &= (j + k)[P + R] - (j + k)[R] - [jP] - [kP] + 2[\infty]
\end{align*}

### Example 11.6

This is the double and add algo. $j$ is the final accumulated value, $k$ is the doubled value.

We count up with $j$ until we reach $n$. $i$ keeps track of how much is left.

### Example 11.7

We are calculating $f_P$, so $R = \infty$.

# Lemma 11.23

$d$ is independent of the choice of $X$, so we can use $g(X - U)$ instead of $g(X)$.

# Lemma 11.24

\begin{align*}
\div(f_T) &= n[T] - n[\inf] \\
\div(f_T(X_0 - X)) &= n[X_0 - T] - n[X_0] \\
\div(F_T') &= n[X_0] - n[X_0 - T]
\end{align*}
\begin{align*}
D_S' &= [S] - [\inf] \\
D_T' &= [X_0] - [X_0 - T]
\end{align*}
\begin{alignat*}{2}
F_T'(D_S') &= \left(\frac{1}{f_T(X_0 - S)}\right)\left(\frac{1}{f_T(X_0)}\right)^{-1} &&= \frac{f_T{X_0}}{f_T{X_0 - S}} \\
F_S'(D_T') &= f_S(X_0) f_S(X_0 - T)^{-1} &&= \frac{f_S(X_0)}{f_S(X_0 - T)}
\end{alignat*}

# Lemma 11.26

We can see this because $\ord(\alpha) = |B|$ so by Lagrange's theorem $|B| \mid |Hom(B)|$,
but also $|A| \mid n$. Since the pairing function is non-degenerate, values must be unique.
$$\alpha(1) = \mu$$
$$\alpha(1 + 1) = \alpha(1) \cdot \alpha(1) = \alpha(1)^2$$
$$\implies \alpha(1)^m = \alpha(m \cdot 1)$$

The map $\Phi$ is a decomposition into the group's basis.

# Lemma 11.31

$$P, Q \in E(\mathbb{F}_q)[n], R \in E(\bar{\mathbb{F}_q}) : Q = nR$$
Since the pairing is 1, so $R - \phi R \in \ker \psi = (\phi - 1) E[n]$. So there must be a $T \in E[n]$
such that $R = -T$ or $R - \phi R = \phi T - T$ since $\phi(-R) = \phi(R_x, -R_y) = (\phi(R_x), -\phi(R_y)) = -\phi(T)$.
We can rearrange this to get
$$\phi(R + T) = R + T$$
This means $\phi$ fixes the coordinates in $\mathbb{F}_q \implies R + T \in E(\mathbb{F}_q)$ and $Q = n(R + T)$.

# Alternative Weil Pairing

$$D_P \sim [P] - [\infty]$$
$$D_Q \sim [Q] - [\infty]$$
$$\supp(D_P) \cap \supp(D_Q) = \varnothing$$
$$e_n(P, Q) = \frac{f_{D_P}(D_Q)}{f_{D_Q}(D_P)}$$
$$D_P = [P + S] - [S]$$
$$D_Q = [Q] - [\infty]$$

You can also have
$$D_Q = [Q + R] - [R]$$
But the support must be disjoint, and $P, Q \in E[n]$.

\begin{align*}
e_n(P, Q) &= \frac{f_{D_P}(D_Q)}{f_{D_Q}(D_P)} \\
          &= \frac{f_{D_P}(P + S)}{f_{D_P}(S)} / \frac{f_{D_Q}(Q + T)}{f_{D_Q}(T)}
\end{align*}
where $P, Q \in E[n]$ and $S, T \in E(K)$.

## Independence of Choice for $D_Q$.

Let $D_Q' \sim D_Q$, then $D_Q' - D_Q \in \textrm{Prin}(E)$.
We assume div(h) and $D_P$ have disjoint support. Since $D_Q' \sim D_Q$, then
$$D_Q' = D_Q + \div{(h)}$$
$$\div{(f_Q')} = nD_Q', \div{(f_Q)} = nD_Q \implies f_Q' = f_Q h^n$$
\begin{align*}
e_n(P, Q) &= \frac{f_{D_P}(D_Q')}{f_{D_Q'}(D_P)} \\
          &= \frac{f_{D_P}(D_Q)f_{D_P}(\div({h})}{f_{D_Q}(D_P)h(D_P)^n} \\
\end{align*}
But note that $h(D_P)^n = h(D_P)\cdots h(D_P) = h(n D_P)$ due to how evaluation on a divisor
is defined. Since $\div({f_{D_P}}) = n D_P \implies h(D_P)^n = h(\div({f_{D_P}}))$.
\begin{align*}
e_n(P, Q) &= \frac{f_{D_P}(D_Q)f_{D_P}(\div({h})}{f_{D_Q}(D_P)h(\div{(f_{D_P})})} \\
\end{align*}
Now use the Weil reciprocity to get the relation
$$e_n(P, Q) = \frac{f_{D_P}(D_Q)}{f_{D_Q}(D_P)}$$

# Linear Equivalence of Riemann Roch Spaces

Let $D' = D + \div{g}$. Then
$$\phi : \mathcal{L}(D') \rightarrow \mathcal{L}(D)$$
$$\phi(f) = fg$$
is an isomorphism.

Proof:
Let $f \in \mathcal{L}(D)$ then
$$\div f \geq -D' \iff \div fg = \div f + \div g \geq -D' + \div g$$
But $-D' + \div g = -D$ so
$$\div fg \geq -D \implies \div fg \in \mathcal{L}(D)$$

# Translation Doesn't Change Divisors up to Equivalence

See [here](https://math.stackexchange.com/questions/2446400/pullback-of-a-translation-map-of-a-divisor).

$$\phi : E(K) \rightarrow \textrm{Pic}(E)$$
$\phi$ is a bijection.
$$\phi(P) = [P] - [\infty]$$

Define our transformation
$$\tau: E(K) \rightarrow E(K)$$
$$\tau(A) = A + Q$$

Let $P + Q = R$, then from 11.2
$$[R] \sim [P] + [Q] - [\infty]$$
Let
$$D \sim [P] - [\infty]$$

$\tau$ is our transformation $\tau(A) = A + Q$ which means
\begin{align*}
\tau^*(D) &= \sum n_i [\tau^{-1}(P_i)] \\
          &\sim [P - Q] - [-Q]
\end{align*}

Our main question then is whether we can prove $\tau^*D \sim D$

First note that $(P - Q) + Q = P$ and since $[A + B] \sim [A] + [B] - [\infty]$, then
$[P] \sim [P - Q] + [Q] - [\infty]$ or
$$[P - Q] \sim [P] + [\infty] - [Q]$$
Let $P = \infty$ and we see that
$[-Q] \sim 2[\infty] - [Q]$$
Subtracting both equations we see that
$$[P - Q] - [-Q] \sim [P] - [\infty]$$
$$\implies \tau^*D \sim D$$

## Simpler Proof

$$\div(f) = m[P] - m[\infty]$$
Let $h(S) = f(S + T)$ then $h$ has a zero when $S + T = P$
$\implies S = P - T$
Likewise a pole at $S + T = \infty$ or $S = -T$
$$\div(h) = m[P - T] - m[-T]$$
Multiplicities are left intact.

# Derive Group Law Using Riemann-Roch

[From here](https://math.stackexchange.com/questions/3072705/derive-group-law-on-elliptic-curve-with-riemann-roch?rq=1).

$$J: E(K) \rightarrow \Pic{E}$$
$$J(P) = [P] - [\inf]$$

## Injective: $J(P) = J(Q) \implies P = Q$

Let $J(P) \sim J(Q)$, then $[P] - [Q] = \div(f)$

From Riemann-Rich, we get $\ell([Q]) = 1$ and since $f \in \mathcal{L}([Q])$, we see that $f$ is
constant $\implies$ P = Q.

This was also proved in 11.3

## Surjective: $\forall D \in \Pic{E}, \exists P : J(P) = D$

Let $D \in \Div{E}$. $D$ has a canonical representation $[P] - [\inf]$ because $g = 1$.

Now note that $\ell(D + [\inf]) = \ell([P]) = 1$.

Take $f \in \mathcal{L}(D + [\inf])$ as a generator, then $\div(f) = -D - [\inf] + [P]$.

$$\mathcal{L}(D + [\inf]) = \{ f : \div(f) + [P] \geq 0 \}$$
$$\deg(\div(f)) = 0$$
$$\implies \div(f) = -D - [\inf] + [P]$$

We can see that $\deg([P]) = \deg([\inf]) = 1$ so $P \in E(K)$ and so
$$J(P) = [P] - [\inf] \sim D$$

# References

- [A Whirlwind Tour of Elliptic Curves](https://web.northeastern.edu/dummit/docs/talk_NTS_elliptic_curves.pdf)
- [Projective embedding of proper algebraic curves](https://web.ma.utexas.edu/users/gregoric/EmbeddingCurves.pdf)
