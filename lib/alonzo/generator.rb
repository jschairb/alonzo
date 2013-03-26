require 'fileutils'
require 'active_support/inflector'

module Alonzo
class Generator

  class RbClassGenerator
    attr_accessor :klass_names, :root
    attr_reader    :files

    def initialize(klass_names, root)
      self.klass_names = klass_names
      self.root        = root

      @files = []

      klass_names.each do |klass_name|
        @files << klass_file(klass_name)
        @files << spec_file(klass_name)
      end
    end

    def klass_file(klass_name)
      { name: klass_file_path(klass_name),
        content: klass_file_template(klass_name) }
    end

    def klass_file_path(klass_name)
      File.join(root, "lib", "#{klass_name.underscore}.rb")
    end

    def klass_file_template(klass_name)
      template = ""
      wrap_modules(template, klass_name.split("::"))
      template
    end

    def spec_file(klass_name)
      { name: spec_file_path(klass_name),
        content: spec_file_template(klass_name) }
    end

    def spec_file_path(klass_name)
      File.join(root, "spec", "#{klass_name.underscore}_spec.rb")
    end

    def spec_file_template(klass_name)
      template = "require 'spec_helper'\n\n"
      wrap_modules(template, klass_name.split("::"), 0, true)
      template
    end

    private

    def indent(size)
      " " * size
    end

    def statement_begin(type, name, indent_level = 0)
      "#{indent(indent_level)}#{type} #{name}#{" do" if type == :describe}\n"
    end

    def statement_end(indent_level = 0)
      "#{indent(indent_level)}end\n"
    end

    def wrap_modules(template, modules, indent = 0, spec = false)
      module_name = modules.shift
      type = if modules.any?
               :module
             elsif spec
               :describe
             else
               :class
             end
      return if module_name.nil?
      template << statement_begin(type, module_name, indent)
      wrap_modules(template, modules, indent + 2, spec)
      template << statement_end(indent)
      template
    end
  end

    attr_accessor :args, :output, :root
    attr_reader   :generator, :generator_class

    def self.generate(args, options = {})
      generator = new(args, options)
      generator.generate
    end

    def initialize(args, options = {})
      self.args   = args
      self.output = options.delete(:output) || STDOUT
      self.root   = options.delete(:root) || Dir.pwd

      generator_klass_name = "#{options[:type]}_generator".classify
      @generator_class = "#{self.class.name}::#{generator_klass_name}".constantize
      @generator       = generator_class.new(args, root)
    end

    def generate
      output.puts "Generating #{generator_class} files"
      generator.files.each do |file|
        output.puts "    #{file[:name]}"
        FileUtils.mkdir_p(File.dirname(file[:name]))
        File.open(file[:name], "w") { |f| f << file[:content] }
      end
    end
  end
end
