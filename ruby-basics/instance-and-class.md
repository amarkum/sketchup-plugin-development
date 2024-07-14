
# Ruby Concepts

## 1. Instance Methods vs. Class Methods

### 1.1 Instance Methods
Instance methods are methods that belong to instances (individual objects) of a class or module. When you include a module into another module or class, the instance methods from the included module are made available to instances of that class or module.

```ruby
module Greetings
  def say_hello
    "Hello!"
  end
end

class Person
  include Greetings
end

person = Person.new
puts person.say_hello  # Outputs: "Hello!"
```

In this example, the `say_hello` method is available to instances of the `Person` class because the `Greetings` module is included. The `Person` class gains access to the instance methods of `Greetings`.

### 1.2 Class Methods
Class methods are methods that belong to the class itself, not to any particular instance. These methods can be called on the class directly.

```ruby
class MyClass
  def self.class_method
    "I am a class method"
  end
end

puts MyClass.class_method  # Outputs: "I am a class method"
```

In this case, `class_method` is a method defined on the class level and is invoked directly on the class (`MyClass`), not on an instance of the class.

