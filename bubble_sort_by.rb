def bubble_sort_by(arr)
	num_passes = 0
	sorted = false

	until sorted
		sorted = true
		i = 0

		while i < arr.size - 1 - num_passes
			if yield(arr[i], arr[i + 1]) > 0
				arr[i], arr[i + 1] = arr[i + 1], arr[i]
				sorted = false
			end

			i += 1
		end

		break if sorted == true
	end

	p arr
end


bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
	left.length - right.length
end
#result should be ["hi", "hey", "hello"]