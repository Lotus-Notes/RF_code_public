# String formatting

template = "Dear {}, you are awesome. Take this ${} bag"

a = "John"
a1 = 10000
b = "Jack"
b1 = 1000
c = "Marie"
c1 = 300

s1 = template.format(a, a1)
print(s1)

s2 = template.format(b, b1)
print(s2)

s3 = template.format(c, c1)
print(s3)

### f-strings make this way easier ###

print(f"Dear {a}, you are awesome. Take this ${a1} bag!")
