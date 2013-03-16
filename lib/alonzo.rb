module Alonzo
  class << self
    def root
      @root ||= File.expand_path(File.join(File.dirname(__FILE__), ".."))
    end
  end
end

require 'alonzo/version.rb'
require_relative 'alonzo/generator'
