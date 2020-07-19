def what_is(x)
  x == 42 ? 'everything' : x == 42 ** 42 ? 'everything everythinged' : 'nothing'
end

def what_is(x)
  if x.equal?(42)
    'everything'
  elsif x == 42 ** 42
    'everything everythinged'
  else
    'nothing'
  end
end