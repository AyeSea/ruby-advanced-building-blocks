module Enumerable
	def my_each
		for i in self
			yield(i)
		end

		self
	end


	def my_each_with_index
		i = 0

		while i < self.size
			yield(self[i], i)
			i += 1
		end

		self
	end


	def my_select
		new_arr = []
		self.my_each{|item| new_arr << item if yield(item)}
		new_arr
	end


	def my_all?
		self.my_each{|item| return false if !yield(item)}
		true
	end


	def my_any?
		self.my_each{|item| return true if yield(item)}
		false
	end


	def my_none?
		self.my_each{|item| return true if !yield(item)}
		false
	end


	def my_count
		counter = 0
		self.my_each{|item| counter += 1}
		counter
	end

=begin
#my_map method (default version)
	def my_map
		new_arr = []
		self.my_each{|item| new_arr << yield(item)}
		new_arr
	end
=end

=begin
#my_map method modified to take a proc
	def my_map(&proc_var)
		new_arr = []
		self.my_each{|item| new_arr << proc_var.call(item)}
		new_arr
	end
=end


#my_map method modified to take a proc and/or block.
#executes both proc and block if both are supplied.
#executes proc if only proc supplied. executes block if only block supplied.
	def my_map(proc_var=nil)
		new_arr = []

		if proc_var && block_given?
			self.my_each{|item| new_arr << proc_var.call(yield(item))}
		elsif proc_var
			self.my_each{|item| new_arr << proc_var.call(item)}
		else
			self.my_each{|item| new_arr << yield(item)}
		end

		new_arr
	end


	def my_inject(num=0)
		accum = num
		self.my_each{|item| accum = yield(accum, item)}
		accum
	end
end


def multiply_els(arr)
	arr.my_inject(1){|accum, num| accum * num}
end

p [1,2,3,4,5].my_each{|num| puts num + 1}
p [1,2,3,4,5].my_each_with_index{|num, idx| print "number: #{num + 1}, index: #{idx}\n"}
p [1,2,3,4,5].my_select{|num| num % 2 == 0}
p [1,2,3,4,5].my_all?{|num| num > 0}
p [1,2,3,4,5].my_any?{|num| num > 4}
p [1,2,3,4,5].my_none?{|num| num > 0}
p [1,2,3,4,5].my_count
#p [1,2,3,4,5].my_map{|num| num * 2}
p [1,2,3,4,5].my_inject(10){|accum, num| accum + num}
p multiply_els([2,4,5])

doubler = Proc.new{|num| num * 2}
#p [1,2,3,4,5].my_map(&doubler)

p [1,2,3,4,5].my_map(&doubler)
p [1,2,3,4,5].my_map{|num| num + 1}
p [1,2,3,4,5].my_map(doubler){|num| num + 1}