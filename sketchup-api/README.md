
# SketchUp API Overview

The SketchUp Ruby API provides powerful tools for extending the functionality of SketchUp through Ruby scripting. It enables automation of tasks, creation of custom tools, and manipulation of SketchUp models programmatically. This document gives a brief overview of the most frequently used API classes, methods, and data types.

## API Data Types

SketchUp API includes several core data types and classes to represent models, geometry, and transformations within SketchUp. These types are essential when manipulating objects within SketchUp:

1. **Sketchup::Model**: Represents the entire SketchUp model. It contains all the entities, layers, materials, and components that make up the model.
2. **Sketchup::Entities**: Represents a collection of geometric entities like edges, faces, groups, and components.
3. **Sketchup::Face**: Represents a flat surface within a model. It is defined by edges and can be manipulated in 3D space.
4. **Sketchup::Edge**: A straight line that connects two vertices and forms the boundaries of a face.
5. **Sketchup::Group**: A collection of entities grouped together. Groups isolate geometry and are independent of other groups or components.
6. **Sketchup::ComponentDefinition**: Defines reusable geometry, such as doors, windows, or furniture, which can be instantiated multiple times in a model.
7. **Sketchup::ComponentInstance**: Represents an individual instance of a component in the model.
8. **Geom::Transformation**: Handles transformations such as translation, rotation, and scaling of entities in 3D space.
9. **Sketchup::Materials**: Represents the materials applied to faces in a model.
10. **Sketchup::Layer**: Manages visibility and organization of entities in a model.

## Commonly Used Classes and Methods

### 1. `Sketchup.active_model`

Returns the currently active model in SketchUp. This model contains all the geometry, materials, and components that make up the 3D model.

```ruby
model = Sketchup.active_model
```

### 2. `Sketchup::Entities#add_face`

Adds a face to the model by specifying an array of points that define the face’s edges. Faces are the primary way to create surfaces in SketchUp.

```ruby
entities = model.entities
points = [[0, 0, 0], [10, 0, 0], [10, 10, 0], [0, 10, 0]]
face = entities.add_face(points)
```

### 3. `Sketchup::ComponentDefinition#add_instance`

Adds an instance of a component to the model using a transformation matrix to position it.

```ruby
component_def = model.definitions.add("MyComponent")
transformation = Geom::Transformation.new([0, 0, 0])
instance = model.entities.add_instance(component_def, transformation)
```

### 4. `Sketchup::Entities#add_group`

Creates a group in the model and adds entities (such as faces and edges) to the group. Groups are useful for isolating geometry to prevent unwanted merging.

```ruby
group = model.entities.add_group
group.entities.add_face([ [0, 0, 0], [10, 0, 0], [10, 10, 0], [0, 10, 0] ])
```

### 5. `Geom::Transformation`

Allows transformations like scaling, translation, and rotation. It is frequently used when working with component instances and moving entities.

```ruby
point = Geom::Point3d.new(10, 10, 0)
transformation = Geom::Transformation.translation(point)
```

### 6. `Sketchup::Entities#each`

Iterates through all entities in the current model. Useful for finding and manipulating specific types of entities (e.g., faces or edges).

```ruby
model.entities.each do |entity|
  if entity.is_a?(Sketchup::Face)
    # Do something with the face
  end
end
```

### 7. `Sketchup::Face#pushpull`

Extrudes a face along the Z-axis to create 3D geometry from 2D surfaces.

```ruby
face.pushpull(10) # Extrudes the face by 10 units
```

### 8. `Sketchup::Selection#add`

Adds an entity (or entities) to the current selection in SketchUp. You can then manipulate the selected entities.

```ruby
selection = model.selection
selection.add(face)
```

### 9. `Sketchup::Material`

Represents materials that can be applied to faces in SketchUp. You can assign colors and textures to surfaces.

```ruby
materials = model.materials
material = materials.add("NewMaterial")
material.color = "red"
```

### 10. `Sketchup::Entities#erase_entities`

Erases selected entities from the model, effectively deleting them.

```ruby
entities_to_delete = model.selection
model.active_entities.erase_entities(entities_to_delete)
```

## Summary

The SketchUp API provides a rich set of tools to programmatically interact with and manipulate SketchUp models. Whether you are creating new geometry, organizing entities into groups or components, or applying transformations, the API makes it easy to automate tasks and extend SketchUp's functionality.

Refer to SketchUp’s official [API documentation](https://ruby.sketchup.com/) for a complete list of classes, methods, and more advanced use cases.
