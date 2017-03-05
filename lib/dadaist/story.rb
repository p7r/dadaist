module Dadaist
  class Story
    def initialize(templates, sources_directory=nil)
      @templates          = templates
      @sources_directory  = sources_directory
      @b = binding
    end

    def generate
      renderer = ERB.new(@templates.sample)
      renderer.result(@b)
    rescue NameError => e
      raise unless @sources_directory
      @b.local_variable_set(e.name, OpenStruct.new(JSON.parse(File.read("#{@sources_directory}/#{e.name}.json")).sample))
      retry
    end
  end
end
