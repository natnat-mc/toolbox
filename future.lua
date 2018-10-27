--[[ future
	backports features from Lua 5.3
]]

-- polyfill for os.execute
if _VERSION<'Lua 5.2' then
	local exe=os.execute
	function os.execute(a)
		local v=exe(a)
		return v==0 or nil, 'exit', v
	end
end
