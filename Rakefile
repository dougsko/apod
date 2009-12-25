require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "apod"
    gem.summary = "A library to work with NASA's astronomy pictures of the day."
    gem.description = "A library to work with NASA's astronomy pictures of the day."
    gem.email = "dougtko@gmail.com"
    gem.homepage = "http://github.com/dougsko/apod"
    gem.authors = ["dougsko"]
    gem.add_development_dependency "rspec"
    gem.add_dependency "hpricot"
    gem.add_dependency "httpclient"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
  spec.spec_opts = ['--color']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
  spec.spec_opts = ['--color']
end

#task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
require 'darkfish-rdoc'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "apod #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.options += [
    '-N',
    '-f', 'darkfish',
  ]
end
