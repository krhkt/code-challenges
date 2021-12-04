# this one has a bug in codewars and I couldn't figure out why my answer was not working
# same answer in JS works just fine

def alphanumeric?(text)
  /^[a-zA-Z0-9]|+$/.match? text
end