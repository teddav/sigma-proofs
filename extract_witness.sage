load("ec_setup.sage")

H = E.random_point()

# known commitment
v = Fr(123)
r = Fr.random_element()
print(f"v: {v}, r: {r}")
C = v * G + r * H

v_prime = Fr.random_element()
r_prime = Fr.random_element()
A = v_prime * G + r_prime * H

print("Sending commitments C and A to verifier")

print("challenge should be computed as: hash(G, H, C, A)")
c = Fr.random_element()

s1 = v_prime + c * v
s2 = r_prime + c * r

print("Sending (c, s1, s2) to the verifier")
assert s1 * G + s2 * H == A + c * C
print("Proof is valid")

c_prime = Fr.random_element()
s1_prime = v_prime + c_prime * v
s2_prime = r_prime + c_prime * r

print("Sending (c_prime, s1_prime, s2_prime) to the verifier")
assert s1_prime * G + s2_prime * H == A + c_prime * C
print("Proof is valid")

print("\nLet's try to recover v and r")
assert s1_prime * G + s2_prime * H - c_prime * C == s1 * G + s2 * H - c * C
assert (s1_prime - s1) * G + (s2_prime - s2) * H + (c - c_prime) * C == 0

# s1 G + s2 H + cv G + cr H = 0
# (s1 + cv) G + (s2 + cr) H = 0
# so we have:
# . s1_prime - s1 + (c - c_prime) * v = 0 -> v = (s1 - s1_prime) / (c - c_prime)
# . s2_prime - s2 + (c - c_prime) * r = 0 -> r = (s2 - s2_prime) / (c - c_prime)

print("\nRecovered v and r:")
recovered_v = (s1 - s1_prime) / (c - c_prime)
recovered_r = (s2 - s2_prime) / (c - c_prime)
print(f"recovered_v: {recovered_v}, recovered_r: {recovered_r}")
assert recovered_v == v
assert recovered_r == r
