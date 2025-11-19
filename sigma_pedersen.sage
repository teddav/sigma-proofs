load("ec_setup.sage")


H = E.random_point()

x = Fr(123)
r = Fr.random_element()
C = x * G + r * H

print("Sending commitment C to verifier")

r1 = Fr.random_element()
r2 = Fr.random_element()
T = r1 * G + r2 * H

print("Sending T to the verifier")

print("challenge should be computed as: c = hash(G, H, C, T)")
c = Fr.random_element()

s1 = r1 + c * x
s2 = r2 + c * r

print("Sending (s1, s2) to the verifier")
assert s1 * G + s2 * H == T + c * C
print("Proof is valid")