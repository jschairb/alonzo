require 'active_support/inflector'
require 'erb'

module Alonzo
  class Generator
    attr_accessor :args, :root, :type

    # Alonzo::Generator.generate(:rb_class, "./", ["MyClass", "Foo::MyClass"])
    def self.generate(type, root, args)
      generator = new(type, root, args)
      generator.generate
    end

    def initialize(type, root, args)
      self.args = args
      self.root = root
      self.type = type
    end

    def generate
    end
  end
end
