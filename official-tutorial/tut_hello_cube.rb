require 'sketchup.rb'
require 'extensions.rb'

module Examples
  module HelloCube

    unless file_loaded?(__FILE__)
      ex = SketchupExtension.new('Hello Cube', 'tut_hello_cube/main')
      ex.description = 'SketchUp Ruby API example creating a cube.'
      ex.version     = '1.0.0'
      ex.copyright   = 'Trimble Navigations © 2016'
      ex.creator     = 'SketchUp'
      Sketchup.register_extension(ex, true)
      file_loaded(__FILE__)
    end

  end # module HelloCube
end # module Examples