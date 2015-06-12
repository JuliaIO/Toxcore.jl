function export_tox_consts(filename)
	consts = ASCIIString[]
	file = open(filename, "r")
	
	while(!eof(file))
		line = readline(file)

		if ismatch(r"const .*", line)
			# tox.h
			m = match(r"TOX_([A-Z,_])*", line)
			if m != nothing
				push!(consts, m.match)
			end		

			# toxav.h
			m = match(r"Tox([A-z,_])*", line)
			if m != nothing
				push!(consts, m.match)
			end

			m = match(r"av_([A-z,_])*", line)
			if m != nothing
				push!(consts, m.match)
			end
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

			# tox.h
			m = match(r"TOX_([A-Z,_])*", line)
			if m != nothing
				push!(typealiases, m.match)
			end

			m = match(r"tox_([A-z,_])*", line)
			if m != nothing
				push!(typealiases, m.match)
			end

			# toxav.h
			m = match(r"Tox([A-z,_])*", line)
			if m != nothing
				push!(typealiases, m.match)
			end

			m = match(r"av_([A-z,_])*", line)
			if m != nothing
				push!(typealiases, m.match)
			end	
		end
	end

	for t in typealiases
		println("export $(t)")
	end
end

println("# typealias")
export_tox_typealias(  Pkg.dir("Toxcore.jl", "src", "gen", "tox.h.jl") )
println("")
println("# consts")
export_tox_consts(  Pkg.dir("Toxcore.jl", "src", "gen", "tox.h.jl") )
println("")
println("# typealias")
export_tox_typealias(  Pkg.dir("Toxcore.jl", "src", "gen", "toxav.h.jl") )
println("")
println("# consts")
export_tox_consts( Pkg.dir("Toxcore.jl", "src", "gen", "toxav.h.jl") )


