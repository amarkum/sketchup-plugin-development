
# Differences between `include Shared` and `class << self; include Shared; end`

| **Aspect**                     | **`include Shared`**                           | **`class << self; include Shared; end`**             |
|--------------------------------|------------------------------------------------|------------------------------------------------------|
| **Where Methods Are Available**| Available as **instance methods**             | Available as **class methods**                       |
| **How to Call Methods**        | Called on an instance of the class            | Called directly on the class (no instance needed)    |
| **Usage Example**              | `instance.method_name`                        | `ClassName.method_name`                              |
| **Typical Use Case**           | When methods are specific to each instance (e.g., actions on individual bank accounts) | When methods are utility or helper functions used at the class level (e.g., class-wide validations) |
| **Method Sharing**             | Each instance of the class can use the methods| The class itself uses the methods without instances  |
| **Example in Banking Context** | Logging actions on an individual bank account | Performing security checks or validations across accounts |
| **Code Example**               | `class BankAccount; include Shared; end`      | `class << self; include Shared; end`                 |
| **Access to Methods**          | Directly available to instance methods within the class | Directly available to class methods within the class |

## Practical Examples in a Banking Context

### `Shared` Module
```ruby
module Shared
  # Instance method for logging actions
  def log_action(action)
    puts "Logging action: #{action}"
  end

  # Class method for validating transactions
  def self.validate_transaction(amount)
    puts "Validating transaction: $#{amount}"
    amount > 0
  end
end
```

### Using `include(Shared)` in a Bank Class (Instance Methods)
```ruby
class BankAccount
  include Shared  # Include at instance level

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    if self.class.validate_transaction(amount)  # Using class method on self
      @balance += amount
      log_action("Deposited $#{amount}")  # Using instance method from Shared
    else
      log_action("Failed deposit: Invalid amount $#{amount}")
    end
  end

  # Class << self is not included here, so we call validate_transaction on Shared directly.
  def self.validate_transaction(amount)
    Shared.validate_transaction(amount)
  end
end

# Creating an instance and using the instance method
account = BankAccount.new
account.deposit(100)
# Output:
# Validating transaction: $100
# Logging action: Deposited $100

account.deposit(-50)
# Output:
# Validating transaction: $-50
# Logging action: Failed deposit: Invalid amount $-50
```

### Using `class << self; include(Shared); end` in a Bank Class (Class Methods)
```ruby
class Security
  class << self
    include Shared  # Include at class level
  end

  def self.flag_fraudulent_activity(amount)
    if validate_transaction(amount)  # Using class method from Shared
      log_action("No fraud detected for transaction of $#{amount}")
    else
      log_action("Fraud detected for transaction of $#{amount}")
    end
  end
end

# Using class methods directly on the class
Security.flag_fraudulent_activity(100)
# Output:
# Validating transaction: $100
# Logging action: No fraud detected for transaction of $100

Security.flag_fraudulent_activity(-500)
# Output:
# Validating transaction: $-500
# Logging action: Fraud detected for transaction of $-500
```

### Summary in the Banking Context

- **Instance Methods (`include Shared` in `BankAccount`):**
  - The `log_action` method is used as an instance method in the `BankAccount` class.
  - Each `BankAccount` object can call `log_action` to log specific actions like deposits.
  - Example: `account.deposit(100)` logs a successful deposit or a failed deposit attempt.

- **Class Methods (`class << self; include Shared` in `Security`):**
  - The `log_action` method is used as a class method in the `Security` class.
  - We can call `flag_fraudulent_activity` directly on the `Security` class to check transactions for fraud without creating an instance.
  - Example: `Security.flag_fraudulent_activity(-500)` checks if a transaction amount is suspicious and logs the result.

By including the `Shared` module in different ways, we define whether its methods are available at the instance level or class level. This allows for flexible design in a banking system where some functionalities are better suited as instance-specific (like account actions) and others as class-wide operations (like security checks).
