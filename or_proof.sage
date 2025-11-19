load("ec_setup.sage")

H = E.random_point()

# known commitment
x = Fr(123)
P1 = x * G

# unknown commitment
P2 = E.random_point()

print("Sending P1 and P2 to the verifier")

r = Fr.random_element()
T1 = r * G

c2 = Fr.random_element()
s2 = Fr.random_element()
T2 = s2 * H - c2 * P2

print("Sending T1 and T2 to the verifier")
print("Verifier sends challenge c")
c = Fr.random_element()

c1 = c - c2

s1 = r + c1 * x

print("Sending (c1, c2, s1, s2) to the verifier")
assert s1 * G == T1 + c1 * P1
assert s2 * H == T2 + c2 * P2
assert c1 + c2 == c
print("Proof is valid")