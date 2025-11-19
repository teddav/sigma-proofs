load("ec_setup.sage")

H = E.random_point()

print("Here we prove that the same value is encoded in 2 Pedersen commitments")

x = Fr(123)
b1 = Fr.random_element()
b2 = Fr.random_element()
P1 = x * G + b1 * H
P2 = x * G + b2 * H

print("Sending commitments P1 and P2 to the verifier")

r_x = Fr.random_element()
r_b1 = Fr.random_element()
r_b2 = Fr.random_element()

T1 = r_x * G + r_b1 * H
T2 = r_x * G + r_b2 * H

print("Sending T1 and T2 to the verifier")

print("challenge should be computed as: hash(G, H, P1, P2, T1, T2)")
c = Fr.random_element()

s1 = r_x + c * x
s2 = r_b1 + c * b1
s3 = r_b2 + c * b2

print("Sending (c, s1, s2) to the verifier")
assert s1 * G + s2 * H == T1 + c * P1
assert s1 * G + s3 * H == T2 + c * P2
print("Proof is valid")