def chain(num)
  raise "Zero is invalid" if num == 0
  return [1] if num == 1
  results = []
  if num.even?
    results << chain(num / 2).insert(0, num)
  else
    results << chain(num*3 + 1).insert(0, num)
  end
  results.flatten
end

if __FILE__ == $0
  puts chain(50).inspect
end
