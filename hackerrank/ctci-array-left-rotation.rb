# https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem

def rotLeft(a, d)
  d = d % a.size
  [*a[d..], *a[0...d]]
end

def rotLeft_v1(a, d)
  d = d % a.size
  (1..d).each { |_| a.push a.shift }
  a
end