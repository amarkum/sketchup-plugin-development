require 'sketchup.rb'

module Examples
  module HelloCube

    def self.get_system
      mac = Object::RUBY_PLATFORM =~ /darwin/i
      win = Object::RUBY_PLATFORM =~ /mswin/i || Object::RUBY_PLATFORM =~ /mingw/i

      # Check and return the platform as "Mac" or "Windows"
      if mac
        return "Mac"
      elsif win
        return "Windows"
      else
        return "Other"
      end
    end

    def self.create_cube
      model = Sketchup.active_model
      model.start_operation('Create Cube', true)
      group = model.active_entities.add_group
      entities = group.entities
      points = [
        Geom::Point3d.new(0,   0,   0),
        Geom::Point3d.new(1.m, 0,   0),
        Geom::Point3d.new(1.m, 1.m, 0),
        Geom::Point3d.new(0,   1.m, 0)
      ]
      face = entities.add_face(points)
      face.pushpull(-1.m)
      model.commit_operation
    end

    unless file_loaded?(__FILE__)
      menu = UI.menu('Plugins')
      menu.add_item('Create Cube Example') {
        self.create_cube
      }

      file_loaded(__FILE__)
    end

  end # module HelloCube
end # module Examples