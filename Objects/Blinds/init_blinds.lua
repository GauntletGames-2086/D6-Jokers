local init_blinds = function(base_file_path)
	--[[local blind_files = NFS.getDirectoryItems(base_file_path.."/blind LuaList")
	local blinds_to_inject = {}
	local order_list = NFS.load(base_file_path.."/blinds_config.lua")()

	--assemble list of blinds_to_inject
	for k, file in pairs(blind_files) do
		if string.find(file, ".lua") then
			local blind = NFS.load(base_file_path.."/blind LuaList/"..file)()
			blinds_to_inject[#blinds_to_inject+1] = blind
		end
	end

	table.sort(blinds_to_inject, function(a, b) return a.order < b.order end)

	local curr_blind_order = 1
	for _, blind in pairs(blinds_to_inject) do
		blinds_to_inject[curr_blind_order]:register(blind.order)
		curr_blind_order = curr_blind_order + 1
	end]]

end

return {init_func = init_blinds}