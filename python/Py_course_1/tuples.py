a = (3, 2, 22, 13) # tuples are immutable - you cannot change them after you have created

print(a)
print(a[2])

b = (5,) # tuple with one element, comma is always required to invoke tuple class 

### Tuple unpacking ###

tu = (3, 2, 45)
a, b, c = tu

print(a, b, c) # output will be 3 2 45 where a = 3, b = 2, c = 45

### Tuple methods ###

t = (3, 12, 1, 54, 23, 12)

print(t.count(12)) # counts the number of occurances of argument
print(t.index(12)) # return index of first occurance of argument


