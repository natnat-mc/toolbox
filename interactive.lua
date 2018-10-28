
-- ask the user a question
function prompt(question, default)
	while true do
		io.write(question)
		io.write(" [")
		io.write(default and 'Y' or 'y')
		io.write("/")
		io.write(default and 'n' or 'N')
		io.write("] ")
		local ans=io.read('*l'):lower()
		if ans=='' then
			return default
		elseif ans=='y' then
			return true
		elseif ans=='n' then
			return false
		end
	end
end
function ask(q, a)
	while true do
		io.write(q)
		io.write '\n'
		for i, v in ipairs(a) do
			io.write '\t'
			io.write(i)
			io.write ':\t'
			io.write(v)
			io.write '\n'
		end
		local line=tonumber(io.read '*l')
		if line and line==math.floor(line) and a[line] then
			return line, a[line]
		end
	end
end
