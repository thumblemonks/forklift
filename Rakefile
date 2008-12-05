require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => %w[test:gem test:rails]

desc 'Test the forklift plugin for Rails.'
Rake::TestTask.new('test:rails') do |t|
  t.libs << 'lib'
  t.pattern = 'test/rails/*_test.rb'
  t.verbose = true
end

Rake::TestTask.new('test:gem') do |t|
  t.libs << 'lib'
  t.pattern = 'test/gem/*_test.rb'
  t.verbose = true
end


desc 'Generate documentation for the forklift plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Forklift'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
