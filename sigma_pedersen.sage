load("ec_setup.sage")


H = E.random_point()

x = Fr(123)
r = Fr.random_element()
C = x * G + r * H

print("Sending commitment C to verifier")

r1 = Fr.random_element()
r2 = Fr.random_element()
t = r1 * G + r2 * H

print("Sending t to the verifier")

print("challenge should be computed as: c = hash(G, H, C, t)")
c = Fr.random_element()

s1 = r1 + c * x
s2 = r2 + c * r

print("Sending (s1, s2) to the verifier")
assert s1 * G + s2 * H == t + c * C
print("Proof is valid")