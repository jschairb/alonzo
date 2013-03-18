# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','alonzo','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'alonzo'
  s.version = Alonzo::VERSION
  s.author = 'Joshua Schairbaum'
  s.email = 'joshua.schairbaum@gmail.com'
  s.homepage = 'https://github.com/jschairb/alonzo'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Your command-line butler and confidant'
# Add your other files here if you make them
  s.files = %w(
bin/alonzo
lib/alonzo/generator.rb
lib/alonzo/version.rb
lib/alonzo.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','alonzo.rdoc']
  s.rdoc_options << '--title' << 'alonzo' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'alonzo'
  s.add_development_dependency('active_support')
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('rspec')
  s.add_runtime_dependency('gli','2.5.4')
end
