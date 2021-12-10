# https://www.codewars.com/kata/52a89c2ea8ddc5547a000863/train/ruby

def loop_size(node)
  memo = {}
  position = 0

  until memo.key? node.object_id
    memo[node.object_id] = position
    position += 1
    node = node.next
  end

  node_position = memo[node.object_id]

  position - node_position
end


# test area
class Node
  attr_accessor :next
end

def create_chain_for_test(tail_size, loop_size)
  prev_node = start = Node.new
  start.next = start
  return start if loop_size == 1
  (1..tail_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  end_loop = prev_node
  (1...loop_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  prev_node.next = end_loop
  start
end

chain = create_chain_for_test(1, 3)

p loop_size(chain)

