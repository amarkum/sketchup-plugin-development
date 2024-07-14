
# SketchUp Plugin Development Exercises

This guide covers essential hands-on exercises using SketchUp's Ruby API, focusing on commonly used entities such as `Components`, `Entities`, `Faces`, `Edges`, `Groups`, and `Selections`. Each section introduces an important concept or operation that will help you create, manipulate, and explore SketchUp models programmatically.


## Working with Components

Components in SketchUp are reusable objects. This exercise demonstrates how to create a new component definition, add it to the model, and place multiple instances of it at different positions.

### Exercise: Create a Window Component

```ruby
model = Sketchup.active_model
entities = model.entities

# Create a new component definition
component_def = model.definitions.add("WindowComponent")

# Add geometry to the component (e.g., a rectangular window)
points = [[0, 0, 0], [10, 0, 0], [10, 15, 0], [0, 15, 0]]
component_def.entities.add_face(points)

# Place instances of the window component at different locations
transformation = Geom::Transformation.new([20, 20, 0])
instance = entities.add_instance(component_def, transformation)

transformation2 = Geom::Transformation.new([50, 50, 0])
instance2 = entities.add_instance(component_def, transformation2)
```

### Learning Objective
- Understand how to define components and instantiate them at multiple locations.

---

## Manipulating Faces

Faces in SketchUp are flat surfaces defined by edges. This exercise shows how to create faces and apply transformations such as push/pull.

### Exercise: Create and Push/Pull Random Faces

```ruby
model = Sketchup.active_model
entities = model.entities

# Create 10 random square faces and push/pull them to random heights
10.times do
  x = rand(0..50)
  y = rand(0..50)
  point1 = [x, y, 0]
  point2 = [x+10, y, 0]
  point3 = [x+10, y+10, 0]
  point4 = [x, y+10, 0]
  
  face = entities.add_face(point1, point2, point3, point4)
  
  # Push/pull each face by a random height
  height = rand(5..20)
  face.pushpull(height)
end
```

### Learning Objective
- Learn how to automate geometry creation and apply random transformations.

---

## Working with Edges

Edges are the fundamental lines that make up the geometry of a face. This exercise demonstrates creating and working with edges.

### Exercise: Draw and Modify Edges

```ruby
model = Sketchup.active_model
entities = model.entities

# Draw a set of edges to form a hexagon
center = Geom::Point3d.new(0, 0, 0)
radius = 10
edges = []

6.times do |i|
  angle = (i * Math::PI / 3) # Divide 360 degrees into 6 sections (hexagon)
  x = radius * Math.cos(angle)
  y = radius * Math.sin(angle)
  next_point = Geom::Point3d.new(x, y, 0)

  edges << entities.add_line(center, next_point)
end

# Modify the edges by scaling them
scale_transformation = Geom::Transformation.scaling(1.5, 1.5, 1.5)
entities.transform_entities(scale_transformation, edges)
```

### Learning Objective
- Understand how to create edges and transform them programmatically.

---

## Creating and Using Groups

Groups in SketchUp help you manage entities together as a single object. This exercise will help you create and manipulate groups effectively.

### Exercise: Create and Group Random Cubes

```ruby
model = Sketchup.active_model
entities = model.entities

# Create 5 groups with random cube sizes
5.times do
  group = entities.add_group
  group_entities = group.entities

  x = rand(0..20)
  y = rand(0..20)
  size = rand(5..15)

  # Define the points of the base
  point1 = [x, y, 0]
  point2 = [x + size, y, 0]
  point3 = [x + size, y + size, 0]
  point4 = [x, y + size, 0]

  # Add a face and push/pull it to create a cube
  face = group_entities.add_face(point1, point2, point3, point4)
  face.pushpull(size)
end
```

### Learning Objective
- Learn how to use groups to organize geometry and manipulate groups independently.

---

## Advanced Exercises

These exercises are designed to challenge you and give you clarity on more advanced concepts.

### Exercise: Remove All Faces and Edges

```ruby
model = Sketchup.active_model
entities = model.entities

# Select all faces and edges in the model
faces = entities.grep(Sketchup::Face)
edges = entities.grep(Sketchup::Edge)

# Remove all selected faces and edges
entities.erase_entities(faces + edges)
```

### Learning Objective
- Learn how to select and remove specific entities from a model.

### Exercise: Create Random Push/Pull Terrain

```ruby
model = Sketchup.active_model
entities = model.entities

# Create a terrain of random push/pull faces
10.times do |i|
  x = i * 10
  10.times do |j|
    y = j * 10
    face = entities.add_face([x, y, 0], [x+10, y, 0], [x+10, y+10, 0], [x, y+10, 0])
    
    # Push/Pull each face by a random value to simulate terrain
    height = rand(-5..10)
    face.pushpull(height)
  end
end
```

### Learning Objective
- Learn how to use observers to track changes to entities in SketchUp.

---

### Exercise: Add and Modify Materials on Faces

This exercise introduces you to working with materials. You will create a material, apply it to selected faces, and then modify its color.

```ruby
model = Sketchup.active_model
entities = model.entities
materials = model.materials

# Create a new material
new_material = materials.add("RandomMaterial")
new_material.color = "red"

# Apply the material to all faces in the model
faces = entities.grep(Sketchup::Face)
faces.each { |face| face.material = new_material }

# Modify the material color to random values
new_material.color = Sketchup::Color.new(rand(0..255), rand(0..255), rand(0..255))
```



### Learning Objective
- Understand how to create, apply, and modify materials in SketchUp models.
---

### Exercise: Rotate Selected Entities Around a Given Axis

Learn how to apply transformations to selected entities by rotating them around a specified axis.

```ruby
model = Sketchup.active_model
selection = model.selection
entities = selection.grep(Sketchup::Edge)

# Define the center point and axis of rotation
center = Geom::Point3d.new(0, 0, 0)
axis = Geom::Vector3d.new(0, 0, 1)  # Z-axis for rotation

# Create a rotation transformation (90 degrees around the Z-axis)
angle = 90.degrees
transformation = Geom::Transformation.rotation(center, axis, angle)

# Apply the transformation to selected entities
entities.each { |entity| entity.transform!(transformation) }
```

### Learning Objective
- Learn how to select and remove specific entities from a model.

### Exercise: Create Random Push/Pull Terrain

```ruby
model = Sketchup.active_model
entities = model.entities

# Create a terrain of random push/pull faces
10.times do |i|
  x = i * 10
  10.times do |j|
    y = j * 10
    face = entities.add_face([x, y, 0], [x+10, y, 0], [x+10, y+10, 0], [x, y+10, 0])
    
    # Push/Pull each face by a random value to simulate terrain
    height = rand(-5..10)
    face.pushpull(height)
  end
end
```

### Learning Objective
- Learn how to generate random terrain using push/pull with faces.

---

### Exercise: Add an Observer to Track Changes in the Model

Observers in SketchUp allow you to track changes in the model, such as when an entity is modified, added, or removed. This exercise will help you create a custom observer to track changes and display alerts.

```ruby
class MyEntityObserver < Sketchup::EntityObserver
  def onChangeEntity(entity)
    puts "Entity #{entity} has been modified!"
  end
end

# Attach the sketchup-observers to a face in the model
model = Sketchup.active_model
face = model.entities.grep(Sketchup::Face).first

if face
  face.add_observer(MyEntityObserver.new)
  puts "Observer attached to the face."
else
  puts "No face found in the model."
end
```

### Learning Objective
- Learn how to remove faces and edges from a model

---


### Exercise: Remove All Faces and Edges

```ruby
model = Sketchup.active_model
entities = model.entities

# Select all faces and edges in the model
faces = entities.grep(Sketchup::Face)
edges = entities.grep(Sketchup::Edge)

# Remove all selected faces and edges
entities.erase_entities(faces + edges)
```


## Conclusion

This extended set of exercises covers a wide range of operations using the SketchUp Ruby API. By working through these exercises, you will gain a deep understanding of how to manipulate geometry programmatically, manage components, and use more advanced features such as observers and transformations. Experimenting with these concepts will help you automate and optimize your SketchUp workflows.
