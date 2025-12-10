class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def sum(self, p):
        return Point((self.x + p.x), (self.y + p.y))

    def print_point(self):
        print(f"({self.x},{self.y})")

    def __add__(self, p):
        return Point((self.x + p.x), (self.y + p.y))


x1 = int(input("Enter the x-coordinate for point 1: "))
y1 = int(input("Enter the y-coordinate for point 1: "))
p1 = Point(x1,y1)
print(f"Point 1: ({p1.x},{p1.y}) ")

print("\n")

x2 = int(input("Enter the x-coordinate for point 2: "))
y2 = int(input("Enter the y-coordinate for point 2: "))
p2 = Point(x2,y2)
print(f"Point 2: ({p2.x},{p2.y}) ")

# p = p1.sum(p2) # returns a new point which is the sum of p1 and p2

# p.print_point()
print("\n")
P = p1 + p2 # we overloaded the + operator by writing the __add__ function
print(f"The sum of these two points gives the point: ({P.x},{P.y})")
# P.print_point()


# print(f"({p1.x},{p1.y})")
