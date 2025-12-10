name = "Harry" or 'Harry' 

#  H  A  R  R  Y
#  0  1  2  3  4
# -5 -4 -3 -2 -1

print(name)

n = '''This
is 
a multi-line
string'''

print(n)

print(n[0])  # print the first letter in the string
print(n[-1]) # print the last letter in the string

print(name[1:4]) # print the letters 1 to (4-1) in the string 
print(name[2:-1]) # print the letters from 2 to (-1-1)=-2 in the string --> same as name[2:4]

n = "Harry0123456789"
#print(name[0:10:n]) # skip n- 1 characters
print(n[0:10:1])     # skip 0 characters
print(n[0:10:2])     # skip 1 characters

print(n[:4])     # print up to (n-1) characters --> print up to 3rd character 
print(n[1:])     # print from nth character to end of string --> print from 1st character to end of string

#-------------------------------------------------------------------------------------------------------------------

name = "Harry" # strings are immutable
#name[0] = "R"  # you cannot do this

a = len(name) # len tells you the length of string

s = "hello world" 
a = len(s)   # will print 11, blank (space) is counted as a character!

print(s.upper()) #prints upper case
print(s.lower()) #prints lower case 
print(s.capitalize()) #capitalize first character
print(s.title()) #prints title case 

text = "   hello world   "
print(text)
print(text.strip())   # strip all whitespace in string   "hello world"
print(text.rstrip())  # strip right whitespace in string "   hello world"
print(text.lstrip())  # strip left whitespace in string  "hello world   "

word = "Python is fun"
print(word.find("is")) # output is location of find word = 7
print(text.replace("fun", "awesome")) # output is a new string with word replaced

text = "one, two, three"
print(text.split(","))  # splits with "," as delimiter into a python list
print(",".join(['one','two','three']))














