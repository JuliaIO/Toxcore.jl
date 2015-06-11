using Toxcore, Reactive
using Base.Test
function load_client(path_to_client_file)
	if isfile(path_to_client_file)
		savefile = open(path_to_client_file, "r")
		savedata = readbytes(savefile)
		close(savefile)
		tox = tox_new(tox_options_default(), savedata)
		return tox
	end
	return tox_new()
end
immutable ToxcoreClient
	tox::Ptr{Tox}
	signals::Dict{Symbol, Signal}
	function ToxcoreClient(path_to_client_file=Pkg.dir("Toxcore", "client", "bot_savedata.binary"))
		tox = load_client(path_to_client_file)
		new(tox, Dict{Symbol, Signal}())
	end
end
client = ToxcoreClient()

