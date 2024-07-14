
# Ruby Modules and Namespaces

In Ruby, **modules** are a way to group related methods, constants, and classes together. They serve as a container for shared functionality and help organize and structure code. Modules can also act as **namespaces** to avoid name conflicts in larger programs.

## Table of Contents
1. [What are Modules?](#what-are-modules)
2. [Why Use Modules?](#why-use-modules)
3. [Namespaces in Ruby](#namespaces-in-ruby)
4. [Examples](#examples)
    - [Example 1: Creating a Simple Module](#example-1-creating-a-simple-module)
    - [Example 2: Using Modules as Namespaces](#example-2-using-modules-as-namespaces)
5. [Including Modules](#including-modules)
6. [Conclusion](#conclusion)

---

## What are Modules?

Modules in Ruby are similar to classes, but they cannot be instantiated. Instead, they are used to:
- Group methods, constants, and classes together.
- Provide reusable functionality across different classes.
- Act as **namespaces** to avoid naming collisions in larger applications.

Modules are defined using the `module` keyword and can contain methods, constants, and other modules.

```ruby
module MyModule
  def self.say_hello
    "Hello from MyModule!"
  end
end
```

---

## Why Use Modules?

Modules are useful in several scenarios:

1. **Shared Functionality**: You can group related methods in a module and include them in multiple classes.
2. **Organization**: Modules help you organize your code logically.
3. **Namespaces**: By using modules, you can avoid naming conflicts by separating classes and methods into distinct namespaces.

---

## Namespaces in Ruby

A **namespace** is a container for grouping classes, methods, and constants under a specific module to prevent naming conflicts. In Ruby, you can use modules to create namespaces, so that classes or methods with the same name can coexist without conflict.

For example, you might have two classes named `Person` in different contexts. Without namespaces, this would cause conflicts. Modules solve this by scoping them under different namespaces.

---

## Examples

### Example 1: Creating a Simple Module

```ruby
module MathHelper
  def self.square(x)
    x * x
  end
end

puts MathHelper.square(4)  # Output: 16
```

### Explanation:
- The `MathHelper` module contains a method `square` that calculates the square of a number.
- The method is called using `MathHelper.square(4)` because it is defined as a module method (`self.square`).

---

### Example 2: Using Modules as Namespaces

```ruby
module App1
  class Person
    def name
      "Person from App1"
    end
  end
end

module App2
  class Person
    def name
      "Person from App2"
    end
  end
end

person1 = App1::Person.new
person2 = App2::Person.new

puts person1.name  # Output: "Person from App1"
puts person2.name  # Output: "Person from App2"
```

### Explanation:
- Two `Person` classes are defined under different modules (`App1` and `App2`), effectively separating them into different namespaces.
- The `Person` class in `App1` is distinct from the `Person` class in `App2`, even though they share the same name.

---

## Including Modules

You can use the `include` keyword to mix in methods from a module as **instance methods** in a class. When you include a module, the methods from the module are added to the class as instance methods.

```ruby
module Greetable
  def greet
    "Hello!"
  end
end

class User
  include Greetable
end

user = User.new
puts user.greet  # Output: "Hello!"
```

### Explanation:
- The `Greetable` module contains a method `greet`.
- By including the `Greetable` module in the `User` class, instances of `User` now have access to the `greet` method.

---

## Conclusion

Modules are a powerful feature in Ruby, providing a way to group related methods, constants, and classes. They are commonly used for organizing code, sharing functionality, and creating namespaces to prevent naming conflicts. By understanding how to use modules and namespaces, you can write more maintainable and modular code.
