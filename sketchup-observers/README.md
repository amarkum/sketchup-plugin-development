

# SketchUp Observers Explained with Executable Code Examples

Observers in SketchUp allow developers to monitor events within the SketchUp environment and respond accordingly. This guide provides an in-depth explanation of all observer classes available in the SketchUp Ruby API, along with executable code snippets that you can run in the Ruby code editor.

## Table of Contents
1. [Introduction to Observers](#introduction-to-observers)
2. [List of Observer Classes](#list-of-observer-classes)
3. [Observer Classes and Examples](#observer-classes-and-examples)
   - [AppObserver](#appobserver)
   - [ModelObserver](#modelobserver)
   - [EntitiesObserver](#entitiesobserver)
   - [SelectionObserver](#selectionobserver)
   - [ToolsObserver](#toolsobserver)
   - [ViewObserver](#viewobserver)
   - [MaterialsObserver](#materialsobserver)
   - [LayersObserver](#layersobserver)
   - [PagesObserver](#pagesobserver)
   - [ComponentDefinitionObserver](#componentdefinitionobserver)
   - [ComponentInstanceObserver](#componentinstanceobserver)
   - [RenderingOptionsObserver](#renderingoptionsobserver)
4. [Important Considerations](#important-considerations)
5. [Conclusion](#conclusion)

## Introduction to Observers
Observers are special classes that "listen" to specific events in SketchUp. By creating subclasses of these observer classes and implementing their callback methods, you can execute code in response to various events such as adding or removing entities, changing selections, saving models, and more.

## List of Observer Classes
Here is a list of observer classes available in the SketchUp Ruby API:

- `Sketchup::AppObserver`
- `Sketchup::ModelObserver`
- `Sketchup::EntitiesObserver`
- `Sketchup::SelectionObserver`
- `Sketchup::ToolsObserver`
- `Sketchup::ViewObserver`
- `Sketchup::MaterialsObserver`
- `Sketchup::LayersObserver` (Note: In newer versions, layers are referred to as tags)
- `Sketchup::PagesObserver`
- `Sketchup::ComponentDefinitionObserver`
- `Sketchup::ComponentInstanceObserver`
- `Sketchup::RenderingOptionsObserver`


## Observer Classes and Examples

### AppObserver
Monitors application-level events such as opening or closing models.

```ruby
class MyAppObserver < Sketchup::AppObserver
  def onNewModel(model)
    puts "A new model was created."
  end

  def onOpenModel(model)
    puts "A model was opened: #{model.title}"
  end

  def onQuit
    puts "SketchUp is quitting."
  end
end

# Keep a reference to the observer to prevent garbage collection
$my_app_observer = MyAppObserver.new
Sketchup.add_observer($my_app_observer)
```

### ModelObserver
Monitors events related to the model, such as saving, modifying, or changing units.

```ruby
class MyModelObserver < Sketchup::ModelObserver
  def onPostSaveModel(model)
    puts "Model has been saved: #{model.title}"
  end

  def onUnitsChanged(model)
    puts "Units have been changed to: #{model.options['UnitsOptions']['LengthUnit']}"
  end
end

# Keep a reference to the observer
$my_model_observer = MyModelObserver.new
Sketchup.active_model.add_observer($my_model_observer)
```

### EntitiesObserver
Monitors changes to entities within the model, such as adding or removing geometry.

```ruby
class MyEntitiesObserver < Sketchup::EntitiesObserver
  def onElementAdded(entities, entity)
    puts "An entity was added: #{entity.typename}"
  end

  def onElementRemoved(entities, entity_id)
    puts "An entity was removed. Entity ID: #{entity_id}"
  end
end

# Keep a reference to the observer
$my_entities_observer = MyEntitiesObserver.new
Sketchup.active_model.entities.add_observer($my_entities_observer)
```

### SelectionObserver
Monitors changes to the user's selection.

```ruby
class MySelectionObserver < Sketchup::SelectionObserver
  def onSelectionBulkChange(selection)
    puts "Selection changed. Number of items selected: #{selection.count}"
  end

  def onSelectionCleared(selection)
    puts "Selection was cleared."
  end

  def onSelectedAdded(selection, entity)
    puts "Entity added to selection: #{entity.typename}"
  end

  def onSelectedRemoved(selection, entity)
    puts "Entity removed from selection: #{entity.typename}"
  end
end

# Keep a reference to the observer
$my_selection_observer = MySelectionObserver.new
Sketchup.active_model.selection.add_observer($my_selection_observer)
```

### ToolsObserver
Monitors tool activations and changes.

```ruby
class MyToolsObserver < Sketchup::ToolsObserver
  def onActiveToolChanged(tools, tool_name, tool_id)
    puts "Active tool changed to: #{tool_name} (ID: #{tool_id})"
  end
end

# Keep a reference to the observer
$my_tools_observer = MyToolsObserver.new
Sketchup.active_model.tools.add_observer($my_tools_observer)
```

### ViewObserver
Monitors changes to the viewport, such as zooming, panning, or orbiting.

```ruby
class MyViewObserver < Sketchup::ViewObserver
  def onViewChanged(view)
    puts "View has been changed."
  end
end

# Keep a reference to the observer
$my_view_observer = MyViewObserver.new
Sketchup.active_model.active_view.add_observer($my_view_observer)
```

### MaterialsObserver
Monitors changes to the materials collection.

```ruby
class MyMaterialsObserver < Sketchup::MaterialsObserver
  def onMaterialAdd(materials, material)
    puts "A new material was added: #{material.display_name}"
  end

  def onMaterialRemove(materials, material)
    puts "A material was removed: #{material.display_name}"
  end

  def onMaterialChange(materials, material)
    puts "A material was changed: #{material.display_name}"
  end
end

# Keep a reference to the observer
$my_materials_observer = MyMaterialsObserver.new
Sketchup.active_model.materials.add_observer($my_materials_observer)
```

### LayersObserver (TagsObserver)
Monitors changes to layers (tags in newer versions).

```ruby
class MyLayersObserver < Sketchup::LayersObserver
  def onLayerAdded(layers, layer)
    puts "A new layer was added: #{layer.name}"
  end

  def onLayerRemoved(layers, layer)
    puts "A layer was removed: #{layer.name}"
  end

  def onCurrentLayerChanged(layers, layer)
    puts "Current layer changed to: #{layer.name}"
  end
end

# Keep a reference to the observer
$my_layers_observer = MyLayersObserver.new
Sketchup.active_model.layers.add_observer($my_layers_observer)
```

### PagesObserver
Monitors changes to scenes (pages) in the model.

```ruby
class MyPagesObserver < Sketchup::PagesObserver
  def onContentsModified(pages)
    puts "Pages content modified."
  end

  def onElementAdded(pages, page)
    puts "A new scene was added: #{page.name}"
  end

  def onElementRemoved(pages, page)
    puts "A scene was removed: #{page.name}"
  end
end

# Keep a reference to the observer
$my_pages_observer = MyPagesObserver.new
Sketchup.active_model.pages.add_observer($my_pages_observer)
```

### ComponentDefinitionObserver
Monitors changes to component definitions.

```ruby
class MyComponentDefinitionObserver < Sketchup::ComponentDefinitionObserver
  def onComponentInstanceAdded(definition, instance)
    puts "A new instance was added to the definition: #{definition.name}"
  end

  def onComponentInstanceRemoved(definition, instance)
    puts "An instance was removed from the definition: #{definition.name}"
  end
end

# Attach observer to all component definitions
$my_component_definition_observers = []
Sketchup.active_model.definitions.each do |definition|
  observer = MyComponentDefinitionObserver.new
  definition.add_observer(observer)
  $my_component_definition_observers << observer
end
```

### ComponentInstanceObserver
Monitors events on individual component instances.

```ruby
class MyComponentInstanceObserver < Sketchup::ComponentInstanceObserver
  def onComponentInstanceChanged(instance)
    puts "Component instance changed: #{instance.definition.name}"
  end
end

# Attach observer to all component instances
$my_component_instance_observers = []
Sketchup.active_model.entities.grep(Sketchup::ComponentInstance) do |instance|
  observer = MyComponentInstanceObserver.new
  instance.add_observer(observer)
  $my_component_instance_observers << observer
end
```

### RenderingOptionsObserver
Monitors changes to rendering options.

```ruby
class MyRenderingOptionsObserver < Sketchup::RenderingOptionsObserver
  def onRenderingOptionsChanged(rendering_options, key)
    puts "Rendering option changed: #{key} = #{rendering_options[key]}"
  end
end

# Keep a reference to the observer
$my_rendering_options_observer = MyRenderingOptionsObserver.new
Sketchup.active_model.rendering_options.add_observer($my_rendering_options_observer)
```


### Global Variables: Use global variables (prefixed with `$`) or instance variables in a persistent class/module to keep references.

```ruby
# Incorrect: Observer may be garbage collected
Sketchup.active_model.add_observer(MyModelObserver.new)

# Correct: Store observer in a global variable
$my_model_observer = MyModelObserver.new
Sketchup.active_model.add_observer($my_model_observer)
```

### Performance Impact
- **Efficiency:** Keep the code inside observer methods efficient to avoid slowing down SketchUp.
- **Asynchronous Operations:** For long-running tasks, consider running code asynchronously if possible.

### Removing Observers
- **Clean Up:** If an observer is no longer needed, remove it to free up resources.

```ruby
Sketchup.active_model.remove_observer($my_model_observer)
$my_model_observer = nil
```

### Thread Safety
- **UI Updates:** SketchUp's API is not thread-safe. Avoid updating the UI or SketchUp entities from background threads.

## Conclusion
Observers are a powerful feature in the SketchUp Ruby API that enable your extensions to respond dynamically to user actions and model changes. By understanding and utilizing observers, you can create more interactive and responsive tools.

Feel free to copy the code snippets provided and paste them into the SketchUp Ruby console or your preferred Ruby code editor to see them in action. Experiment with different observer methods to suit your specific development needs.

Happy coding!

## References:
- SketchUp Ruby API Documentation
- SketchUp Developer Center
- SketchUp Community Forums
