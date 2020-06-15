local M = {}

M.data = {}
M.subscribe_max_size = 50

function M.clear()
	M.data = {}
end

function M.set_max_subscribe_size(size)
	M.subscribe_max_size = size
end

function M.contains(key)
	return M.data[key] ~= nil
end

function M.subscribe(key, url)
	
	if not M.contains(key) then
		M.data[key] = {}
		for i = 1, M.subscribe_max_size do
			M.data[key][i] = -1
		end
	end

	for i = 1, M.subscribe_max_size do
		if M.data[key][i] == -1 then
			M.data[key][i] = url
			return i
		end
	end

	assert(false, "subscribe_max_size limit over" .. key)
	return -1
end

function M.notify(key, message_id, prop)

	if M.contains(key) then
		for k, url in pairs(M.data[key]) do
--			print(k)
			if not (url == -1) then
				msg.post(url, message_id, prop)
			end
		end
	end
end

function M.remove(key, pos)

	if M.contains(key) then
		M.data[key][pos] = -1
	end

	for k, url in pairs(M.data[key]) do
		if not (url == -1) then
			return
		end
	end

	M.data[key] = nil

end


return M