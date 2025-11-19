load("ec_setup.sage")

# known commitment
x = Fr(123)
Y = x * G

r = Fr.random_element()
T = r * G

print("Sending commitment T to the verifier")

print("challenge should be computed as: c = hash(G, Y, T)")
c = Fr.random_element()

s = r + c * x

print("Sending s to the verifier")
assert s * G == T + c * Y
print("Proof is valid")