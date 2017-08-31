#!/usr/bin/ruby

while s = gets
  begin
    binding.eval(s)
  rescue Exception => e
    p e
  end
end
