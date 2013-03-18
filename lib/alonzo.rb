module Alonzo
  class << self
    def root
      @root ||= File.expand_path(File.join(File.dirname(__FILE__), ".."))
    end
  end
end

require 'alonzo/commands.rb'
require 'alonzo/generator.rb'
require 'alonzo/version.rb'
