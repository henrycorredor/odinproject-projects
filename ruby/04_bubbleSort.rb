# Takes an array and returns a sorted array
# @param numbers_list [Array<integer>] Numbers to sort
# @return [Array<integer>] Sorted numbers
def bubble_sort(numbers_list)
  is_ordered = false
  sorted_list = numbers_list

  until is_ordered
    is_ordered = true
    processing = sorted_list
    sorted_list = Array.new
    last_number = processing.reduce do |next_num, num|
      if (num <=> next_num) == -1
        is_ordered = false
        acc = next_num
        to_push = num
      else
        acc = num
        to_push = next_num
      end
      sorted_list.push(to_push)
      acc
    end
    sorted_list.push(last_number)
  end

  sorted_list
end

print bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]