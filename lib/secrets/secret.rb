require "ostruct"
require "yaml"

module Secrets

  class Secret < OpenStruct

    def initialize path
      @path = path
      if File.exist?(path)
        super(YAML.load_file(path))
      else File.open(path, "w") {}
        super()
      end
    end

    def save
      File.open(@path, "w") { |f| YAML.dump(@table, f) }
    end

  end

end
