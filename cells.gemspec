Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'cells'
  s.version     = "0.5.0"
  s.summary     = '...'
  s.description = '.........'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Whatever'
  s.email             = 'example@example.com'
  s.homepage          = 'http://cells.rubyforge.org'
  s.rubyforge_project = 'cells'

  s.files        = Dir['lib/**/*.rb']
  s.require_path = 'lib'

  s.add_dependency('activesupport', "~> 3.0.0.beta3")
  s.add_dependency('actionpack',    "~> 3.0.0.beta3")
end
