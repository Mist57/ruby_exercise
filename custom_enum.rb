module Enumerable
    def my_each
        i = 0
        while i < length
            yield self[i] unless is_a?(Hash)
            yield [keys[i], values[i]] if is_a?(Hash)
            i += 1
        end
    end

    def my_each_with_index
        i = 0
        while i < length
            yield self[i], i unless is_a?(Hash)
            yield [keys[i], values[i], i] if is_a?(Hash)
            i += 1
        end
    end

    def my_select
        result = []
        self.my_each {|x| result << x if yield(x)}
        return result
    end

    def my_all?
        result = []
        self.my_each {|x| result << x if yield(x)}
        result == self
    end

    def my_any?
        result = []
        self.my_each {|x| return yield(x)}
    end

    def my_none?
        result = []
        self.my_each {|x| return yield(x) ? false : true}
    end

    def my_count
        result = []
        self.my_each {|x| result << x if yield(x)}
        return result.length
    end

    def my_map
        result = []
        self.my_each {|x| result << yield(x)}
        return result
    end

    def my_inject
        i = 0
        result = self[i]
        while i < length - 1
            result = yield(result, self[i + 1])
            i += 1
        end
        return result
    end
end

my_proc = proc {|x| x >= 4}
arr = [1,2,3,4,5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
bar = "--------------------------"

arr.my_each_with_index {|x, i| puts i}
puts bar
puts arr.my_select {|n| n.even?}
puts bar
puts arr.my_all? {|n| n % 6 == n}
puts bar
puts arr.my_any? {|n| n % 6 == n}
puts bar
puts arr.my_none? {|n| n % 6 == n}
puts bar
puts arr.my_count {|n| n % 6 == n}
puts bar
puts arr.my_map {|n| n < 4}
puts bar
puts arr.my_map(&my_proc)
puts bar
puts arr.my_inject {|sum, number| sum + number}
puts bar
puts arr.my_inject {|sum, number| sum * number}