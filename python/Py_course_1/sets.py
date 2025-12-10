fruits = {"apple", "banana", "cherry"}

s = {3, 23, 2, 11}

print(s, type(s))

# print(s[2]) # will not work, sets are not scriptable (un-ordered).  Basically you must show the whole set or nothing

# ------------
### Set Methods ###

s.add(32)
s.remove(11) # removes element IF it is in the set.  If not it will throw error
s.discard(2934) # will remove element if in set, if not I will shut up
s.pop() # removes random element


# --------------
### Set operations ###

a = {3, 23, 1}
b = {23, 4, 2, 55, 1}

c = a.union(b)
print(c)

d = a.intersection(b)
print(d)
