# require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << %w(test lib)
  task.pattern = 'test/test_biostars/test_*.rb'
end

task :default => :test