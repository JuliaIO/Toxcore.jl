module Toxcore

include("gen/tox.h.jl")
include("gen/toxav.h.jl")
include("gen/toxdns.h.jl")

module CInterface

importall Toxcore
import Toxcore.Array_128_Uint8

@windows? begin 
const libtoxcore = Libdl.dlopen(Pkg.dir("Toxcore", "deps", "libtox"))
end : @unix? begin
const libtoxcore = "libtoxcore"
end : error("operating system not yet supported")

include("gen/tox.h.functions.jl")
include("gen/toxav.h.functions.jl")
include("gen/toxdns.h.functions.jl")

end # module CInterface

include("julia_api.jl")

end # module Toxcore
