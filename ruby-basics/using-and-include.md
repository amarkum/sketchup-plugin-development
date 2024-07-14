

# Key Differences Between `using` and `include` in Ruby

In Ruby, both `include` and `using` are mechanisms that provide access to additional functionality or behaviors from modules. However, they serve very different purposes. Understanding their key differences is essential for developers when working with modules and refinements.

## Table of Contents
1. [Overview of `include`](#overview-of-include)
2. [Overview of `using`](#overview-of-using)
3. [Key Differences](#key-differences)
4. [Examples](#examples)
    - [Example 1: Using `include` to Add Module Methods](#example-1-using-include-to-add-module-methods)
    - [Example 2: Using `using` for Refinements](#example-2-using-using-for-refinements)
5. [Conclusion](#conclusion)

---

## Overview of `include`

The `include` keyword in Ruby is used to bring the methods from a module into the current class or module, making them available as instance methods. When you use `include`, it effectively mixes in the module’s methods at the instance level.

### Key Points:
- `include` is used to include module methods as instance methods in the target class.
- It works at the class level and modifies the behavior of the class directly.
- It does **not** change existing methods; it simply adds new ones.

---

## Overview of `using`

The `using` keyword in Ruby is used to activate **refinements** within a specific scope. Refinements allow you to modify or extend existing methods of classes, but unlike `include`, the changes made by `using` only apply to the current scope (such as a file or class).

### Key Points:
- `using` is used to activate refinements.
- Refinements allow you to modify or extend existing class methods.
- Changes introduced by `using` are scoped and do not affect other parts of the code outside the current scope.

---

## Key Differences

- **Scope**:  
  - `include` makes the methods from the module available to all instances of the class where the module is included. 
  - `using`, on the other hand, limits the refinements to the scope where it is used. The refinements will not affect other parts of the program.
  
- **Purpose**:  
  - `include` is used to mix in methods from a module as instance methods.
  - `using` is specifically for activating refinements, which allow modifying or extending existing methods in a controlled scope.

- **Instance vs Refinement**:  
  - With `include`, the module’s methods become instance methods of the class.
  - With `using`, you can refine existing methods, but those refinements are only active within the current scope.

---

## Examples

### Example 1: Using `include` to Add Module Methods

Let's look at how `include` works by adding methods from a module to a class:

```ruby
module Greetable
  def greet
    "Hello!"
  end
end

class Person
  include Greetable
end

person = Person.new
puts person.greet  # Output: "Hello!"
```

### Explanation:
- In this example, the `Greetable` module is included in the `Person` class using `include`.
- The `greet` method from the `Greetable` module becomes available as an instance method of the `Person` class.
- Any instance of `Person` can now call the `greet` method.

### Example 2: Using `using` for Refinements

Now, let's look at `using` in the context of refinements:

```ruby
module StringRefinement
  refine String do
    def shout
      upcase + "!"
    end
  end
end

using StringRefinement

puts "hello".shout  # Output: "HELLO!"
```

### Explanation:
- In this example, we define a refinement inside the `StringRefinement` module that adds a `shout` method to the `String` class.
- The `using` keyword activates this refinement only in the scope where it is called.
- The `shout` method is now available for the `String` class within this scope, but it won’t affect other parts of the code.

### Scoping Example:
```ruby
def outside_scope
  "hello".shout  # This will raise a NoMethodError
end

def inside_scope
  using StringRefinement
  "hello".shout  # This will work: Output: "HELLO!"
end
```

### Explanation:
- The `shout` method is only available within the method `inside_scope`, where `using StringRefinement` was activated.
- The `outside_scope` method does not have access to the `shout` method because the refinement was not activated there.

---

## Conclusion

The key difference between `include` and `using` lies in their purpose and scope:

- **`include`** is used to mix in methods from a module as instance methods. It affects the entire class or module where it’s included, making the module's methods part of the class.
- **`using`** is used to activate refinements, which allow for temporary modifications to existing methods within a specific scope.

Choose `include` when you want to extend a class with new methods globally, and use `using` when you need scoped and temporary refinements to specific methods.
