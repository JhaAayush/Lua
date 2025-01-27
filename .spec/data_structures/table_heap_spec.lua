describe("Table heap", function()
	local table_heap = require("data_structures.table_heap")
	local shuffle = require("random.fisher_yates_shuffle")

	local n = 100
	local list = {}
	for index = 1, n do
		list[index] = index
	end
	shuffle(list)
	local heap = table_heap.new()
	for index = 1, #list do
		heap:push(list[index])
	end
	for index = 1, #list do
		local popped = heap:pop()
		assert.equals(index, popped)
	end
	heap = table_heap.new()
	for i = 1, n do
		heap:push(i)
	end
	heap:replace(42, 0)
	assert.equals(0, heap:pop())
	heap:replace(69, 101)
	local last = 0
	for _ = 1, 98 do
		local new = heap:pop()
		assert.truthy(new > last)
		last = new
	end
	assert.equals(101, heap:pop())
end)