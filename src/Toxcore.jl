module Toxcore

@windows? begin 
const libtoxcore = Libdl.dlopen(Pkg.dir("Toxcore", "deps", "libtox"))
end : @unix? begin
const libtoxcore = "libtoxcore"
end : error("operating system not yet supported")


include("gen/tox.h.jl")
include("gen/toxav.h.jl")
include("gen/toxdns.h.jl")

end # module
