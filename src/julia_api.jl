export tox_new
export tox_kill
export tox_bootstrap
export tox_callback_friend_request
export tox_callback_friend_message
export tox_self_get_address
export tox_self_set_name
export tox_self_set_status_message
export tox_iteration_interval
export tox_iterate
export tox_friend_add_norequest

export tox_public_key_to_string



###################### Util #####################################

function stringToPublicKey(public_key::ASCIIString)
	public_key = hex2bytes(uppercase(public_key))	
	(length(public_key) != TOX_PUBLIC_KEY_SIZE) && throw(error("Tox API Invalid Public Key."))
	return public_key
end

function tox_public_key_to_string(public_key::Ptr{Uint8})
	bytes2hex(pointer_to_array(public_key, TOX_PUBLIC_KEY_SIZE))
end

####################### API  #####################################

function tox_new()
	return CInterface.tox_new(C_NULL, C_NULL, 0, C_NULL)
end

function tox_kill(tox::Ptr{Tox})
	return CInterface.tox_kill(tox)
end

function tox_bootstrap(tox::Ptr{Tox}, host::ASCIIString, port, public_key::ASCIIString)
	public_key = stringToPublicKey(public_key)

	CInterface.tox_bootstrap(tox, host, port, public_key, C_NULL)
end

function tox_self_get_address(tox::Ptr{Tox})
	address = zeros(Uint8,TOX_ADDRESS_SIZE)
    CInterface.tox_self_get_address(tox, address)
    uppercase(bytes2hex(address))
end

function tox_self_set_name(tox::Ptr{Tox}, name::ASCIIString)
	(length(name) > TOX_MAX_NAME_LENGTH) && (name = name[1:TOX_MAX_NAME_LENGTH]) 

	CInterface.tox_self_set_name(tox, name, length(name), C_NULL)
end

function tox_self_set_status_message(tox::Ptr{Tox}, name::ASCIIString)
	(length(name) > TOX_MAX_STATUS_MESSAGE_LENGTH) && (name = name[1:TOX_MAX_STATUS_MESSAGE_LENGTH]) 

	CInterface.tox_self_set_name(tox, name, length(name), C_NULL)
end

function tox_friend_add_norequest(tox::Ptr{Tox}, public_key::ASCIIString)
	public_key = stringToPublicKey(public_key)

	CInterface.tox_friend_add_norequest(tox, public_key, C_NULL)
end

function tox_iterate(tox::Ptr{Tox})
	CInterface.tox_iterate(tox)
	nothing
end

function tox_iteration_interval(tox::Ptr{Tox})
	CInterface.tox_iteration_interval(tox)
end

###################### Callback API #####################################

typealias tox_friend_request_cb_args (Ptr{Tox}, Ptr{Uint8}, Ptr{Uint8}, Csize_t, Ptr{Void})
typealias tox_friend_message_cb_args (Ptr{Tox}, Uint32, TOX_MESSAGE_TYPE, Ptr{Uint8}, Csize_t, Ptr{Void})

function tox_callback_friend_request(tox::Ptr{Tox}, fun::Function)
	!method_exists(fun, tox_friend_request_cb_args) && throw(error("Tox API Callback Error 0"))

	CInterface.tox_callback_friend_request(tox, cfunction(fun, Void, tox_friend_request_cb_args), C_NULL)
	nothing
end


function tox_callback_friend_message(tox::Ptr{Tox}, fun::Function)
	!method_exists(fun, tox_friend_message_cb_args) && throw(error("Tox API Callback Error 1"))

	CInterface.tox_callback_friend_request(tox, cfunction(fun, Void, tox_friend_message_cb_args), C_NULL)
	nothing
end



#=function tox_friend_name_cb(fun::Function)
	args = (Tox *, uint32_t, const uint8_t *, size_t , void *)
	!method_exists(fun, args) && throw(error("lol"))
	cfunction(fun, Void, args)
end


args = (Tox *, uint32_t, const uint8_t *, size_t , void *)

function MyFriendRequest(tox::Ptr{Tox}, public_key::Ptr{Uint8}, message::Ptr{Uint8}, length::Csize_t, user_data::Ptr{Void})
    msg = bytestring(message, length)
    println(msg)
    println(bytes2hex(pointer_to_array(public_key,TOX_PUBLIC_KEY_SIZE)))
    Toxcore.CInterface.tox_friend_add_norequest(my_tox, public_key, C_NULL)
    nothing
end =#