Gem::Specification.new do |s|
  s.name = 'logstash-filter-imgsize'
  s.version         = '1.0.1'
  s.licenses = ['Apache License (2.0)']
  s.summary = "Make image size(width, height) filter"
  s.description     = "Make image size(width, height) filter"
  s.authors = ["Loup"]
  s.email = 'loup1788@gmail.com'
  s.homepage = "https://github.com/YukSeungChan/logstash-filter-imgsize"
  s.require_paths = ["lib"]

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", ">= 1.20", "<= 2.99"
  s.add_runtime_dependency 'fastimage', '~> 2.0', '>= 2.0.0'

  s.add_development_dependency 'logstash-devutils'
end
