def bubble_sort(arr)
	num_passes = 0
	sorted = false

	until sorted
		sorted = true
		i = 0

		while i < arr.size - 1 - num_passes
			if arr[i] > arr[i + 1]
				arr[i], arr[i + 1] = arr[i + 1], arr[i]
				sorted = false
			end

			i += 1
		end

		break if sorted == true
	end
	
	p arr
end

bubble_sort([4,3,78,2,0,2])
#result should be [0,2,2,3,4,78]