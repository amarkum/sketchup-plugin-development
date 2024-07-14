
# SketchUp Extension: Hello Cube

This is the official SketchUp tutorial project called `Hello Cube`. It demonstrates how to set up a simple SketchUp extension using Ruby. The extension creates a cube in your model when activated. This guide will help you understand the setup process and get started with SketchUp extension development.

## Table of Contents
- [Overview](#overview)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [How It Works](#how-it-works)
- [License](#license)

---

## Overview

The `Hello Cube` extension is a simple plugin that showcases the basics of creating an extension for SketchUp. This tutorial will guide you through creating a basic Ruby script, packaging it as an extension, and loading it into SketchUp. It also covers essential concepts such as the `Sketchup::Entities` API, creating geometric shapes (e.g., a cube), and defining basic user interaction.

### What this tutorial covers:
- Setting up a SketchUp extension.
- Creating geometry (a simple cube).
- Basic Ruby scripting within SketchUp.

---

## Requirements

To follow this tutorial, you need:
- **SketchUp**: Version 2020 or later.
- **Ruby**: SketchUp comes with a built-in Ruby interpreter, but you'll need a basic understanding of Ruby to write and understand the code.
- **A Code Editor**: Any text editor will work, but using an editor with Ruby syntax highlighting, like VSCode or Sublime Text, is recommended.

---

## Installation

Follow these steps to install the extension into SketchUp:

1. **Download or Clone the Repository**:
   Clone or download this repository to your local machine.

   ```bash
   git clone https://github.com/your-repo/tut_hello_cube.git
   ```

2. **Set Up the Extension**:
   Copy the `tut_hello_cube` folder to SketchUp's Plugins folder.

   - On Windows: `C:/Users/<YourUsername>/AppData/Roaming/SketchUp/SketchUp 2021/SketchUp/Plugins/`
   - On macOS: `/Library/Application Support/SketchUp 2021/SketchUp/Plugins/`

3. **Launch SketchUp**:
   Open SketchUp. The extension will automatically load and you can find the "Hello Cube" extension under the **Extensions** menu.

---

## Usage

Once you have installed the extension, follow these steps to create a cube:

1. Open SketchUp and create a new file.
2. Go to the **Extensions** menu and select **Hello Cube**.
3. The extension will create a simple cube (10x10x10) in the model's origin.

---

## How It Works

This tutorial introduces the following key concepts:

### 1. **Extension Setup**:
The code starts by defining a new `SketchupExtension` and loading it into SketchUp.

```ruby
# Define the extension
hello_cube_extension = SketchupExtension.new('Hello Cube', 'hello_cube/main')

# Register the extension
Sketchup.register_extension(hello_cube_extension, true)
```

### 2. **Creating the Cube**:
The main logic of the extension creates a cube using Ruby's SketchUp API. This is done by defining the corner points and creating faces between them.

```ruby
model = Sketchup.active_model
entities = model.entities

# Define the points for the cube's corners
points = [
  [0, 0, 0], [10, 0, 0], [10, 10, 0], [0, 10, 0],   # Bottom face
  [0, 0, 10], [10, 0, 10], [10, 10, 10], [0, 10, 10] # Top face
]

# Create the bottom face
bottom_face = entities.add_face(points[0], points[1], points[2], points[3])
# Push/Pull the face to create the 3D shape
bottom_face.pushpull(10)
```

### 3. **Menu and Interaction**:
The extension adds a menu item under the Extensions menu for easy access. It uses a simple command structure to integrate the functionality into SketchUp.

```ruby
UI.menu("Plugins").add_item("Hello Cube") {
  model = Sketchup.active_model
  entities = model.entities
  # Cube creation logic here
}
```

---

## License

This tutorial and extension code are licensed under the MIT License. Feel free to modify and use the code in your own projects.
