

# Ruby Classes, Methods, `self`, Constants, Global Variables, Modules, and Namespaces

This guide provides a comprehensive overview of essential Ruby concepts, including classes, methods, the `self` keyword, constants, global variables, modules, and namespaces. These concepts are fundamental to understanding how to structure and organize Ruby code.

## Table of Contents
1. [Classes](#classes)
2. [Methods](#methods)
3. [The `self` Keyword](#the-self-keyword)
4. [Constants](#constants)
5. [Global Variables](#global-variables)
6. [Modules](#modules)
7. [Namespaces](#namespaces)

---

## 1. Classes

In Ruby, classes are blueprints for objects. A class defines the properties (attributes) and behaviors (methods) of the objects it creates. You can create a class using the `class` keyword.

### Example:
```ruby
class Car
  def initialize(make, model)
    @make = make
    @model = model
  end

  def info
    "Car: #{@make} #{@model}"
  end
end

my_car = Car.new("Toyota", "Camry")
puts my_car.info  # Output: "Car: Toyota Camry"
```

### Explanation:
- The `Car` class has an initializer (`initialize`) method, which sets up attributes (`@make` and `@model`) when a new object is created.
- The `info` method returns information about the car.

---

## 2. Methods

Methods in Ruby define the behavior of an object. They are blocks of code that belong to a class and perform certain tasks.

### Instance Methods
Instance methods operate on individual instances (objects) of a class.

```ruby
class Animal
  def sound
    "Generic animal sound"
  end
end

dog = Animal.new
puts dog.sound  # Output: "Generic animal sound"
```

### Class Methods
Class methods are defined on the class itself, not on instances of the class.

```ruby
class MathHelper
  def self.square(x)
    x * x
  end
end

puts MathHelper.square(4)  # Output: 16
```

### Explanation:
- `self.square` is a class method, meaning it can be called directly on the `MathHelper` class without needing an instance.

---

## 3. The `self` Keyword

The `self` keyword in Ruby refers to the current object. It can be used in different contexts, such as inside an instance method, class method, or outside of any method.

### Example:
```ruby
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def say_hello
    "Hello, I am #{self.name}."
  end

  def self.info
    "This is the Person class."
  end
end

puts Person.info  # Class method
person = Person.new("Alice")
puts person.say_hello  # Instance method
```

### Explanation:
- Inside the instance method `say_hello`, `self` refers to the instance (`person`).
- In the class method `info`, `self` refers to the `Person` class itself.

---

## 4. Constants

Constants in Ruby are variables whose value is not meant to change. By convention, constants are written in uppercase letters.

### Example:
```ruby
class Planet
  GRAVITY = 9.8  # Constant

  def self.gravity_on_earth
    "Earth's gravity is #{GRAVITY} m/s²."
  end
end

puts Planet.gravity_on_earth  # Output: "Earth's gravity is 9.8 m/s²."
```

### Explanation:
- `GRAVITY` is a constant that belongs to the `Planet` class. It is accessed inside a class method.

---

## 5. Global Variables

Global variables in Ruby are accessible from anywhere in the program. They are prefixed with a dollar sign (`$`). While global variables can be useful in some situations, they should be used sparingly as they can make debugging more difficult.

### Example:
```ruby
$global_var = "I am a global variable!"

def show_global_var
  puts $global_var
end

show_global_var  # Output: "I am a global variable!"
```

### Explanation:
- `$global_var` is a global variable that can be accessed from both inside and outside the method `show_global_var`.

---

## 6. Modules

Modules in Ruby are containers for methods, constants, and classes. They can be used to group related code or to create **namespaces** to avoid conflicts.

### Example:
```ruby
module MathOperations
  def self.square(x)
    x * x
  end
end

puts MathOperations.square(3)  # Output: 9
```

### Explanation:
- The `MathOperations` module contains a method `square` that can be called using `MathOperations.square(3)`.

---

## 7. Namespaces

Namespaces are a way to group related classes, methods, or constants to avoid naming conflicts. In Ruby, modules are often used to define namespaces.

### Example:
```ruby
module Library
  class Book
    def info
      "This is a book."
    end
  end
end

module Store
  class Book
    def info
      "This is a product in the store."
    end
  end
end

book1 = Library::Book.new
book2 = Store::Book.new

puts book1.info  # Output: "This is a book."
puts book2.info  # Output: "This is a product in the store."
```

### Explanation:
- Both the `Library` and `Store` modules contain a `Book` class, but they represent different concepts.
- By using namespaces (`Library::Book` and `Store::Book`), we avoid naming conflicts.

---

## Conclusion

This guide provides a foundational understanding of key Ruby concepts such as classes, methods, the `self` keyword, constants, global variables, modules, and namespaces. Understanding these concepts is essential for writing clean, organized, and maintainable Ruby code.
