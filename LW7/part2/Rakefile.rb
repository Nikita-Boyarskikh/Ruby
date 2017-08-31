#!/usr/bin/ruby

require 'rake/testtask'

task :default => %w[test]

Rake::TestTask.new do |t|
  t.test_files = FileList.new("test_*.rb")
  t.verbose = true
end
