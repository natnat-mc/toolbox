--[[ future
	backports features from Lua 5.3
]]

if _VERSION<'Lua 5.2' then
	-- os.execute returns a boolean before the value
	local exe=os.execute
	function os.execute(a)
		local v=exe(a)
		return v==0 or nil, 'exit', v
	end
	
	-- math.log takes an optional base
	local ln=math.log
	function math.log(a, b)
		if not b then
			return ln(a)
		end
		return ln(a)/ln(b)
	end
	
	-- unpack goes in table lib
	table.unpack=unpack
	
	-- string.rep accepts a separator
	local rep=string.rep
	function string.rep(str, n, sep)
		if not sep then
			return rep(str, n)
		end
		return string.sub(rep(str..sep, n), 1, -#sep-1)
	end

	-- xpcall accepts arguments
	local xp=xpcall
	function xpcall(fn, msgh, ...)
		if select('#', ...)==0 then
			return xp(fn, msgh)
		end
		local n=select('#', ...)
		local args={...}
		return xp(function()
			return fn(unpack(args, 1, n))
		end, msgh)
	end
	
	-- file:write returns file
	local filemeta=getmetatable(io.stdout)
	local write=filemeta.write
	function filemeta:write(...)
		local function ret(val, ...)
			if val then
				return self
			end
			return val, ...
		end
		return ret(write(self, ...))
	end
	
	--TODO give arguments to io.lines and file:lines
	--TODO give a mode to load and loadfile
	--TODO give an environement to load and loadfile
	--TODO create package.searchpath
	--TODO io.popen():close() returns status
	--TODO io.read '*L'
	
	-- __pairs metamethod
	function pairs(a)
		local ok, meta=pcall(getmetatable, a)
		if ok and meta and meta.__pairs then
			return meta.__pairs(a)
		end
		return next, a, nil
	end
	
	-- __ipairs metamethod
	local inext=ipairs({})
	function ipairs(a)
		local ok, meta=pcall(getmetatable, a)
		if ok and meta and meta.__pairs then
			return meta.__pairs(a)
		end
		return inext, a, 0
	end
	
	-- load takes mode and env; string chunks are this chunk
	local realload=load
	function load(chunk, source, mode, env)
		--FIXME handle mode
		local loaded, err
		if type(chunk)=='string' then
			loaded, err=loadstring(chunk, source)
		else
			loaded, err=realload(chunk, source)
		end
		--FIXME set env
		return loaded, err
	end
end
