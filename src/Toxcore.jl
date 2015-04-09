module Toxcore

const libtoxcore = Libdl.dlopen(Pkg.dir("Toxcore", "deps", "libtox"))

include("structs.jl")
export Tox
export TOX_PROXY_TYPE
export Tox_Options
export TOX_MESSAGE_TYPE
export TOX_PUBLIC_KEY_SIZE
include("funs.jl")

export tox_new
export tox_callback_friend_request
export tox_callback_friend_message

export tox_self_set_name
export tox_self_set_status
export tox_self_set_status_message
export tox_bootstrap
export tox_iterate
export tox_iteration_interval
export tox_kill


end # module
