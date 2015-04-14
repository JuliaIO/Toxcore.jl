

function tox_friend_name_cb(fun::Function)
	args = (Tox *, uint32_t, const uint8_t *, size_t , void *)
	!method_exists(fun, args) && throw(error("lol"))
	cfunction(fun, Void, args)
end

function tox_callback_friend_name (Tox *tox, fun::Function)
	fun_ptr = tox_friend_name_cb(fun)
	tox_callback_friend_name(tox, fun_ptr, C_NULL)
end

function tox_friend_name_cb(Tox *, uint32_t, const uint8_t *, size_t , void *)
	toxfun(tox, bytestring(name, length))
end

tox_callback_friend_name(my_Tox, LOL_EY)





############

function generate_callback(f::Function, argtypes::Tuple(DataType...))
    isgeneric(f) && method_exists(f, argtypes) -> Boo) && return cfunction(f, Void, argtypes)
    cfunction(func, Void, argtypes)
end