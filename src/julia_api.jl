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
export tox_friend_send_message
export tox_friend_add
export tox_get_savedata
export tox_options_default
export tox_self_get_friend_list
export tox_friend_get_name


export ToxPublicKey
export ToxAddress
export ToxSavedata
export Tox_Options

###################### ToxPublicKey #####################################

immutable ToxPublicKey
	ptr::Ptr{Uint8}
end

function ToxPublicKey()
    ToxAddress(pointer(zeros(Uint8,TOX_PUBLIC_KEY_SIZE)))
end

function ToxPublicKey(public_key::ASCIIString)
	Base.convert(ToxPublicKey, public_key)
end

function Base.convert(::Type{ASCIIString}, public_key::ToxPublicKey)
	uppercase(bytes2hex(pointer_to_array(public_key.ptr, TOX_PUBLIC_KEY_SIZE)))
end

function Base.convert(::Type{ToxPublicKey}, string::ASCIIString)
	public_key = hex2bytes(uppercase(string))	
	(length(public_key) != TOX_PUBLIC_KEY_SIZE) && throw(error("Tox API Invalid Public Key."))

	return ToxPublicKey(pointer(public_key))
end

###################### ToxAddress #####################################

immutable ToxAddress
	ptr::Ptr{Uint8}
end

function ToxAddress()
    ToxAddress(pointer(zeros(Uint8,TOX_ADDRESS_SIZE)))
end

function ToxAddress(address::ASCIIString)
	Base.convert(ToxAddress, address)
end

function Base.convert(::Type{ASCIIString}, address::ToxAddress)
	uppercase(bytes2hex(pointer_to_array(address.ptr, TOX_ADDRESS_SIZE)))
end

function Base.convert(::Type{ToxAddress}, string::ASCIIString)
	address = hex2bytes(uppercase(string))	
	(length(address) != TOX_ADDRESS_SIZE) && throw(error("Tox API Invalid Address."))

	return ToxAddress(pointer(address))
end

###################### ToxOptions #####################################


#############################################################################################
# First API. Functions have the same name as in Toxcore, but take other arguments			#
#############################################################################################

#
# tox_options_default
#
function tox_options_default()
	options = Tox_Options()
	options = Ref(options)
	CInterface.tox_options_default(options)
	options.x
end

#
# tox_new
#
function tox_new()
	return CInterface.tox_new(C_NULL, C_NULL, 0, C_NULL)
end

function tox_new(options::Tox_Options, savedata::Vector{Uint8})
	return CInterface.tox_new(C_NULL, savedata, length(savedata), C_NULL)
end

#
# tox_kill
#
function tox_kill(tox::Ptr{Tox})
	return CInterface.tox_kill(tox)
end

#
# tox_get_savedata
#
function tox_get_savedata(tox::Ptr{Tox})
	savedata = zeros(Uint8, CInterface.tox_get_savedata_size(tox))

	CInterface.tox_get_savedata(tox, savedata)
	return savedata
end

#
# tox_bootstrap
#
function tox_bootstrap(tox::Ptr{Tox}, host::ASCIIString, port, public_key::ToxPublicKey)
	CInterface.tox_bootstrap(tox, host, port, public_key.ptr, C_NULL)
end

#
# tox_self_get_address
#
function tox_self_get_address(tox::Ptr{Tox})
	address = ToxAddress()
    CInterface.tox_self_get_address(tox, address.ptr)
    address
end

#
# tox_self_set_name
#
function tox_self_set_name(tox::Ptr{Tox}, name::ASCIIString)
	(length(name) > TOX_MAX_NAME_LENGTH) && (name = name[1:TOX_MAX_NAME_LENGTH]) 

	CInterface.tox_self_set_name(tox, name, length(name), C_NULL)
end


#
# tox_self_get_friend_list
#
function tox_self_get_friend_list(tox::Ptr{Tox})
	friendlist = zeros(Uint32, CInterface.tox_self_get_friend_list_size(tox))

	CInterface.tox_self_get_friend_list(tox, friendlist)
	friendlist
end

#
# tox_friend_add
#

function tox_friend_add(tox::Ptr{Tox}, address::ToxAddress, message::UTF8String)
end

function tox_friend_add(tox::Ptr{Tox}, address::ToxAddress, message::Ptr{Uint8}, length::Integer)


end

#
# tox_friend_get_name
#
# returns "" if the friend does not exist. utf8 encoding expected
#
function tox_friend_get_name(tox::Ptr{Tox}, friend_number::Integer)
	name_size = CInterface.tox_friend_get_name_size(tox, friend_number, C_NULL)

	if name_size > TOX_MAX_NAME_LENGTH	# this happens if the friend does not exist
		return ""
	end

	name = zeros(Uint8, name_size)
	CInterface.tox_friend_get_name(tox, friend_number, name, C_NULL)

	return utf8(name)
end

#
# tox_self_set_status_message
#
function tox_self_set_status_message(tox::Ptr{Tox}, message::ASCIIString)
	(length(message) > TOX_MAX_STATUS_MESSAGE_LENGTH) && (message = message[1:TOX_MAX_STATUS_MESSAGE_LENGTH]) 

	CInterface.tox_self_set_status_message(tox, message, length(message), C_NULL)
end

#
# tox_friend_send_message
#
# split a message into several messages if it is to long
#
function tox_friend_send_message(tox::Ptr{Tox}, friend_number::Uint32, message::UTF8String)

	messages = tox_split_message(message)

	for message in messages
		tox_friend_send_message(tox, friend_number, TOX_MESSAGE_TYPE_NORMAL, pointer(message.data), length(message.data))
	end
end

function tox_friend_send_message(tox::Ptr{Tox}, friend_number::Uint32, _type::TOX_MESSAGE_TYPE, message::Ptr{Uint8}, length::Integer)

	(length > TOX_MAX_MESSAGE_LENGTH) && throw(error("Tox API Message to long!"))

	CInterface.tox_friend_send_message(tox, friend_number, _type, message, length, C_NULL)
end

#
# tox_friend_add_norequest
#
function tox_friend_add_norequest(tox::Ptr{Tox}, public_key::ToxPublicKey)
	CInterface.tox_friend_add_norequest(tox, public_key.ptr, C_NULL)
end

#
# tox_iterate
#
function tox_iterate(tox::Ptr{Tox})
	CInterface.tox_iterate(tox)
	nothing
end

#
# tox_iteration_interval
#
function tox_iteration_interval(tox::Ptr{Tox})
	CInterface.tox_iteration_interval(tox)
end

###################### Low-Level Callback API #####################################

typealias tox_friend_connection_status_cb_args (Ptr{Tox}, Uint32, TOX_CONNECTION, Ptr{Void})
typealias tox_friend_request_cb_args (Ptr{Tox}, Ptr{Uint8}, Ptr{Uint8}, Csize_t, Ptr{Void})
typealias tox_friend_message_cb_args (Ptr{Tox}, Uint32, TOX_MESSAGE_TYPE, Ptr{Uint8}, Csize_t, Ptr{Void})

#
# tox_callback_friend_connection_status
#
function tox_callback_friend_connection_status(tox::Ptr{Tox}, fun::Function, user_data::Ptr{Void})
	!method_exists(fun, tox_friend_connection_status_cb_args) && throw(error("Tox API Callback Error"))

	CInterface.tox_callback_friend_connection_status(tox, cfunction(fun, Void, tox_friend_connection_status_cb_args), user_data)
	nothing
end

#
# tox_callback_friend_request
#
function tox_callback_friend_request(tox::Ptr{Tox}, fun::Function, user_data::Ptr{Void})
	!method_exists(fun, tox_friend_request_cb_args) && throw(error("Tox API Callback Error"))

	CInterface.tox_callback_friend_request(tox, cfunction(fun, Void, tox_friend_request_cb_args), user_data)
	nothing
end

#
# tox_callback_friend_message
#
function tox_callback_friend_message(tox::Ptr{Tox}, fun::Function, user_data::Ptr{Void})
	!method_exists(fun, tox_friend_message_cb_args) && throw(error("Tox API Callback Error"))

	CInterface.tox_callback_friend_message(tox, cfunction(fun, Void, tox_friend_message_cb_args), user_data)
	nothing
end







