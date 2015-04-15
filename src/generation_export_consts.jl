function export_tox_consts(filename)
	consts = ASCIIString[]
	file = open(filename, "r")
	
	while(!eof(file))
		line = readline(file)

		if ismatch(r"const .*", line)
			m = match(r"TOX_([A-Z,_])*", line)
			
			if m != nothing
				push!(consts, m.match)
			end

			m = match(r"TOX_([A-Z,_])*", line)
			
			if m != nothing
				push!(consts, m.match)
			end			
			av_
		end
	end

	for c in consts
		println("export $(c)")
	end
end

function export_tox_typealias(filename)
	typealiases = ASCIIString[]
	file = open(filename, "r")

	while(!eof(file))
		line = readline(file)

		if ismatch(r"typealias .*", line)
			m = match(r"TOX_([A-Z,_])*", line)
			
			if m != nothing
				push!(typealiases, m.match)
			end

			m = match(r"tox_([A-z,_])*", line)
			
			if m != nothing
				push!(typealiases, m.match)
			end
			
		end
	end

	for t in typealiases
		println("export $(t)")
	end
end

# export_tox_consts("gen/tox.h.jl")
export_tox_typealias("gen/tox.h.jl")


