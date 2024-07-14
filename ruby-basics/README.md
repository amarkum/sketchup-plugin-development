
# Ruby Basic Syntax and Features

This guide covers basic Ruby syntax and key features such as variables, data types, control structures, loops, and methods. It provides a comprehensive overview for beginners looking to get familiar with Ruby.

## Table of Contents
1. [Variables and Data Types](#variables-and-data-types)
2. [String Interpolation](#string-interpolation)
3. [Control Structures](#control-structures)
4. [Loops](#loops)
5. [Methods](#methods)

---

## 1. Variables and Data Types

Ruby supports different data types such as strings, integers, booleans, arrays, and hashes.

```ruby
name = "Alice"  # String
age = 30        # Integer
is_student = true  # Boolean

# Arrays
colors = ["red", "green", "blue"]

# Hashes
person = {name: "Bob", age: 25, job: "Developer"}
```

---

## 2. String Interpolation

You can easily insert variables into strings using `#{}`.

```ruby
puts "Name: #{name}, Age: #{age}"
```

---

## 3. Control Structures

### If-Else Statements

```ruby
if age > 20
  puts "#{name} is older than 20."
else
  puts "#{name} is 20 or younger."
end
```

### Case Statements

```ruby
case age
when 0..12
  puts "Child"
when 13..19
  puts "Teenager"
else
  puts "Adult"
end
```

---

## 4. Loops

### While Loop

```ruby
counter = 0
while counter < 3
  puts "While Loop Counter: #{counter}"
  counter += 1
end
```

### For Loop

```ruby
for color in colors
  puts "Color: #{color}"
end
```

### Each Loop

The `each` loop is preferred when iterating through arrays.

```ruby
colors.each do |color|
  puts "Each Color: #{color}"
end
```

---

## 5. Methods

Methods in Ruby allow you to encapsulate logic that can be reused.

```ruby
def greet(name)
  return "Hello, #{name}!"
end
puts greet("Alice")
```

---

This basic guide covers essential concepts in Ruby, providing a solid foundation to build upon for more advanced topics.




# Ruby Advanced Concepts

This guide dives deeper into advanced Ruby topics such as classes and objects, string manipulation, and other higher-level Ruby features.

## Table of Contents
1. [Classes and Objects](#classes-and-objects)
2. [String Manipulation](#string-manipulation)

---

## 1. Classes and Objects

Ruby is an object-oriented language, so classes and objects are fundamental concepts.

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def birthday
    @age += 1
  end
end

bob = Person.new("Bob", 25)
puts "Bob's age: #{bob.age}"
bob.birthday
puts "Bob's new age: #{bob.age}"
```

---

## 2. String Manipulation

Ruby offers a variety of built-in methods for manipulating strings. Below are some of the most commonly used methods.

### String Case Methods

- `upcase` – Converts all characters to uppercase.
- `downcase` – Converts all characters to lowercase.
- `capitalize` – Capitalizes the first letter of the string.

```ruby
puts name.upcase       # Output: "ALICE"
puts name.downcase     # Output: "alice"
puts name.capitalize   # Output: "Alice"
```

### Substring and Length

- `length` – Returns the number of characters in a string.
- `slice` – Extracts a substring from the string.

```ruby
puts name.length        # Output: 5 (for "Alice")
puts name.slice(0, 3)   # Output: "Ali"
```

### String Concatenation

- `+` – Joins two strings together.
- `<<` – Appends to an existing string.

```ruby
greeting = "Hello" + " World"
greeting << "!"
puts greeting  # Output: "Hello World!"
```

### Reversing and Splitting

- `reverse` – Reverses the string.
- `split` – Splits a string into an array based on a delimiter.

```ruby
puts name.reverse         # Output: "ecilA"
puts greeting.split       # Output: ["Hello", "World!"]
puts greeting.split(" ")  # Output: ["Hello", "World!"]
```

---

This advanced guide covers more complex topics in Ruby, building upon the basics to help you write more powerful and flexible Ruby code.
