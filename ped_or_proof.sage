load("ec_setup.sage")

H = E.random_point()

# known commitment
x = Fr(123)
blinding = Fr.random_element()
P1 = x * G + blinding * H

# unknown commitment
P2 = E.random_point()

print("Sending P1 and P2 to the verifier")

r_x = Fr.random_element()
r_r = Fr.random_element()
T1 = r_x * G + r_r * H

c2 = Fr.random_element()
s2_x = Fr.random_element()
s2_r = Fr.random_element()
T2 = s2_x * G + s2_r * H - c2 * P2

print("Sending T1 and T2 to the verifier")
print("Verifier sends challenge c")
c = Fr.random_element()

c1 = c - c2

s1_x = r_x + c1 * x
s1_r = r_r + c1 * blinding

print("Sending (c1, s1_x, s1_r), (c2, s2_x, s2_r) to the verifier")
assert s1_x * G + s1_r * H == T1 + c1 * P1
assert s2_x * G + s2_r * H == T2 + c2 * P2
assert c1 + c2 == c
print("Proof is valid")