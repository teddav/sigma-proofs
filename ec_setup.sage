p = 929
Fp = GF(p)
E = EllipticCurve(Fp, [5, 15])
G = E.gens()[0]
Fr = GF(G.order())