require "ostruct"
require "yaml"

module Secrets

  class Secret

    def initialize path
      if File.exist?(path)
        YAML.load_file(path).each do |(key, value)|
          instance_variable_set "@#{key}", OpenStruct.new(value)
          define_singleton_method key do
            instance_variable_get "@#{key}"
          end
          define_singleton_method "#{key}=" do |v|
            instance_variable_set "@#{key}", OpenStruct.new(v)
            data = YAML.load_file path
            data[key] = v
            File.open(path, 'w') { |f| YAML.dump(data, f) }
          end
        end
      end
    end

  end

end
