module Alonzo
  module Commands
    class Gen
      DEFAULTS = {
        project_root:  Dir.pwd,
        template_type: :rb_class
      }

      attr_accessor :args, :global, :options, :output

      def self.run(cmd_opts_and_args, options = {})
        gen = new(cmd_opts_and_args, options)
        gen.run
      end

      def self.defaults
        DEFAULTS
      end

      def initialize(cmd_opts_and_args = {}, options = {})
        cmd_opts_and_args.each do |key, value|
          self.send("#{key}=", value)
        end

        self.output = options.delete(:output) || STDOUT
      end

      def run
      end
    end
  end
end
