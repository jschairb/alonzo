module Alonzo
  module Commands
  end
end

klasses = Dir.glob(File.join(File.dirname(__FILE__), "commands", "*.rb"))
klasses.each { |k| require k }
