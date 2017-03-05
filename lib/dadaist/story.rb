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
      obj = JSON.parse(File.read("#{@sources_directory}/#{e.name}.json")).sample
      obj = OpenStruct.new(obj) unless obj.is_a? String
      @b.local_variable_set(e.name, obj)
      retry
    end
  end
end
