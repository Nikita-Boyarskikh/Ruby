#!/usr/bin/ruby
arr = %w[gdsgsdg fhsdgg sdj tgdsgsgsd jgd gdggdg sfgef sds fgda g grhy ggggse]

def procedure_select(arr)
  result = []

  arr.each do |name|
    result << name if name.length > 5
  end

  result
end

p procedure_select(arr)
p(arr.select { |name| name.length > 5 })
