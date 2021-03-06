module Toxcore

include("gen/tox.h.jl")
include("gen/toxav.h.jl")
include("gen/toxdns.h.jl")

module CInterface

	importall Toxcore
	import Toxcore.Array_128_Uint8

	const libtoxcore = @windows? Pkg.dir("Toxcore", "deps", "bin", "libtoxcore") : @linux? "libtoxcore.so" : error("platform not support") 

	include("gen/tox.h.functions.jl")
	include("gen/toxav.h.functions.jl")
	include("gen/toxdns.h.functions.jl")

end # module CInterface

include("util.jl")
include("julia_api.jl")

end # module Toxcore
