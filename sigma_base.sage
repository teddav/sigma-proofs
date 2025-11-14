load("ec_setup.sage")

# known commitment
x = Fr(123)
y = x * G

r = Fr.random_element()
t = r * G

print("Sending commitment t to the verifier")

print("challenge should be computed as: c = hash(G, y, t)")
c = Fr.random_element()

s = r + c * x

print("Sending s to the verifier")
assert s * G == t + c * y
print("Proof is valid")