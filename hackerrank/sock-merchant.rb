# https://www.hackerrank.com/challenges/sock-merchant/problem

  arr.reduce({total_pairs: 0}) do |memo, sock_color|
      memo[sock_color] = 0 unless memo.key? sock_color
      memo[sock_color] += 1
      memo[:total_pairs] += 1 if memo[sock_color].even?
      memo
  end[:total_pairs]
end
