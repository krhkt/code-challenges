# https://www.hackerrank.com/challenges/balanced-brackets/problem

def isBalanced(s)
  stack = []
  opening_brackets = ['(', '[', '{']
  matching_bracket = {
    ')' => '(',
    ']' => '[',
    '}' => '{',
  }

  s.chars.each do |c|
    if opening_brackets.include? c
      stack.push([c, 1]) && next if stack.empty? || stack.last[0] != c

      stack.last[1] += 1
      next
    end

    return 'NO' if stack.empty? || stack.last[0] != matching_bracket[c]

    stack.last[1] -= 1
    stack.pop() if stack.last[1] == 0
  end

  stack.empty? ? 'YES' : 'NO'
end


p isBalanced('{[()]}')
p isBalanced('{[(])}')
p isBalanced('{{[[(())]]}}')
