data = bytes.fromhex(
    "49 60 67 74 63 67 42 66 80 78 69 69 7B 99 6D 88 68 94 9F 8D 4D A5 9D 45 00 00 00 00 00 00 00 00"
)
data = data[:24]

result = []

for i in range(24):
    # reverse operation of `(i ^ *(unsigned __int8 *)(a1 + i)) + 2 * i)`
    # need to modulate the result by 256 to get the correct value
    result.append((data[i] - 2 * i) ^ i % 256)

result = bytes(result)

print(result)
