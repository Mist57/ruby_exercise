require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize(value = nil)
    @head = Node.new(value)
  end

  def append(value)
    tail.next_node = Node.new(value)
  end

  def prepend(value)
    tmp = @head
    @head = Node.new(value)
    @head.next_node = tmp
  end

  def size
    count = 0
    tmp = @head
    loop do
      count += 1
      return count if tmp.next_node.nil?

      tmp = tmp.next_node
    end
  end

  def tail
    tmp = @head
    loop do
      return tmp if tmp.next_node.nil?

      tmp = tmp.next_node
    end
  end

  def at(index)
    count = 0
    tmp = @head
    loop do
      return tmp if count == index

      count += 1
      tmp = tmp.next_node
    end
  end

  def pop
    at(size - 2).next_node = nil
  end

  def contains?(value)
    tmp = @head
    loop do
      return true if tmp.value == value

      tmp = tmp.next_node
      return false if tmp.nil?
    end
  end

  def find(value)
    tmp = @head
    index = 0
    loop do
      return index if tmp.value == value

      index += 1
      tmp = tmp.next_node
      raise "Node with such value doesn't exist." if tmp.nil?
    end
  end

  # format:
  # ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    string = ''
    tmp = @head
    loop do
      string.concat("( #{tmp.value} ) -> ")
      if tmp.next_node.nil?
        string.concat(' nil')
        return string
      end
      tmp = tmp.next_node
    end
  end

  def insert_at(value, index)
    new_node = Node.new(value, at(index))
    at(index - 1).next_node = new_node
  end

  def remove_at(index)
    at(index - 1).next_node = at(index + 1)
  end
end