
# SketchUp UI API - Common Usage Guide

The SketchUp Ruby API includes the `UI` module, which provides access to various User Interface (UI) features in SketchUp. This allows developers to create dialogs, manage timers, show notifications, and interact with the user through simple or advanced UI components.

In this guide, we'll cover the most frequently used UI features with detailed explanations and code examples.

---

## Table of Contents

- [Overview of `UI` Module](#overview-of-ui-module)
- [Message Boxes](#message-boxes)
- [Input Boxes](#input-boxes)
- [Menus](#menus)
- [Toolbars](#toolbars)
- [Notifications](#notifications)
- [Timers](#timers)
- [Dialogs](#dialogs)
- [Status Bar](#status-bar)

---

## Overview of `UI` Module

The `UI` module provides functions that help interact with the user by presenting various types of dialogs and input forms. Commonly used methods include:
- `UI.messagebox`: Show a message to the user.
- `UI.inputbox`: Get input from the user.
- `UI.menu`: Add custom items to the SketchUp menus.
- `UI::Toolbar`: Create custom toolbars.
- `UI.start_timer`: Create timers to run code on a schedule.
- `UI::HtmlDialog`: Create more advanced HTML dialogs.

---

## Message Boxes

Message boxes are simple dialogs that display a message to the user with options like "OK", "Yes/No", etc.

### Example: Simple Message Box

```ruby
UI.messagebox("Hello, SketchUp!")
```

### Example: Message Box with Options

```ruby
result = UI.messagebox("Would you like to proceed?", MB_YESNO)
if result == IDYES
  UI.messagebox("You clicked Yes!")
else
  UI.messagebox("You clicked No!")
end
```

### Parameters:
- `MB_YESNO`: Creates a message box with "Yes" and "No" buttons.
- `IDYES`, `IDNO`: Constants that indicate the button clicked.

---

## Input Boxes

Input boxes are dialogs that prompt the user for input, which can be text, numbers, or other values.

### Example: Simple Input Box

```ruby
prompts = ["Enter your name:", "Enter your age:"]
defaults = ["John Doe", 30]
input = UI.inputbox(prompts, defaults, "User Info")

if input
  name, age = input
  UI.messagebox("Name: #{name}, Age: #{age}")
end
```

### Parameters:
- `prompts`: An array of strings prompting the user.
- `defaults`: An array of default values.
- `title`: A string that defines the window's title.

---

## Menus

Custom menu items can be added to the SketchUp menus (like "File", "Edit", "Tools", etc.) to trigger specific actions.

### Example: Adding a Menu Item

```ruby
UI.menu("Plugins").add_item("Say Hello") {
  UI.messagebox("Hello from the Plugins menu!")
}
```

### Explanation:
- `UI.menu("Plugins")`: Adds an item to the "Plugins" menu.
- `.add_item`: Specifies the label and the action for the menu item.

---

## Toolbars

Toolbars are graphical bars with buttons that can trigger various actions.

### Example: Creating a Toolbar with a Button

```ruby
toolbar = UI::Toolbar.new("My Toolbar")

cmd = UI::Command.new("Hello Button") {
  UI.messagebox("Hello from the toolbar!")
}

cmd.small_icon = "path_to_icon_16x16.png"
cmd.large_icon = "path_to_icon_24x24.png"
cmd.tooltip = "Click to say hello"
cmd.status_bar_text = "Click this button to see a greeting"
cmd.menu_text = "Hello Button"

toolbar = toolbar.add_item(cmd)
toolbar.show
```

### Explanation:
- `UI::Toolbar.new("My Toolbar")`: Creates a new toolbar with the specified name.
- `UI::Command.new`: Defines the action for the toolbar button.
- `.small_icon`, `.large_icon`: Set icons for the button.
- `.tooltip`, `.status_bar_text`, `.menu_text`: Provide user-friendly text for the toolbar button.

---

## Notifications

Notifications are small non-intrusive messages that pop up in SketchUp's notification area.

### Example: Creating a Notification

```ruby
notification = UI::Notification.new("Notification Title", "This is a sample notification.")
notification.show
```

### Explanation:
- `UI::Notification.new`: Creates a new notification with a title and a message.
- `.show`: Displays the notification.

---

## Timers

Timers allow you to run code at a set interval, either once or repeatedly.

### Example: Repeating Timer

```ruby
timer_id = UI.start_timer(1.0, true) {
  UI.messagebox("This will run every 1 second!")
}

# To stop the timer
UI.stop_timer(timer_id)
```

### Explanation:
- `UI.start_timer(interval, repeat)`: Starts a timer. The `interval` is in seconds, and `repeat` determines if it should keep running.
- `UI.stop_timer(timer_id)`: Stops the timer with the corresponding ID.

---

## Dialogs

Dialogs are windows that can display HTML content or native Ruby input.

### Example: HTML Dialog

```ruby
dialog = UI::HtmlDialog.new({
  :dialog_title => "My Dialog",
  :preferences_key => "com.myplugin.dialog",
  :scrollable => true,
  :resizable => true,
  :width => 400,
  :height => 300
})

dialog.set_html("<h1>Hello from HTML Dialog</h1><p>This is some HTML content.</p>")
dialog.show
```

### Explanation:
- `UI::HtmlDialog.new`: Creates an HTML-based dialog window with customizable options.
- `.set_html`: Sets the HTML content for the dialog.

---

## Status Bar

You can display messages in the status bar at the bottom of the SketchUp window.

### Example: Updating the Status Bar

```ruby
UI.status_bar_text = "Ready to work!"
```

### Explanation:
- `UI.status_bar_text`: Directly sets the text displayed in the status bar.

---

## Conclusion

The `UI` module in SketchUp allows you to interact with users via message boxes, input dialogs, menus, toolbars, and more. By combining these features, you can create highly interactive and user-friendly plugins. Feel free to experiment with the examples provided, and use them as a base for more complex user interface interactions.
