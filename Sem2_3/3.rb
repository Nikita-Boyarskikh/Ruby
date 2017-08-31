#!/usr/bin/ruby

Class1 = Class.new(String)
Class2 = Class.new(Class1)

def common_parents(class1, class2)
  superclasses1 = []
  while (sup = class1.superclass) != Object
    superclasses1.push sup
    class1 = sup
  end

  superclasses2 = []
  while (sup = class2.superclass) != Object
    superclasses2.push sup
    class2 = sup
  end

  superclasses1 & superclasses2
end

p Class2.superclass == Class1
p common_parents(Class2, Class1).any?
