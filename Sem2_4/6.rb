#!/usr/bin/ruby
print 'Enter new method name: '
method_name = gets.chomp

define_method(method_name) { "Method #{method_name} called!" }

puts "List of all defined methods: #{methods.sort}"
puts send(method_name)
