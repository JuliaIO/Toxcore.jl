export tox_new
export tox_kill
export tox_bootstrap
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

export tox_file_send
export tox_file_send_chunk

export tox_callback_file_chunk_request
export tox_callback_file_recv
export tox_callback_file_recv_chunk
export tox_callback_file_recv_control

export tox_callback_friend_request
export tox_callback_friend_message


export ToxPublicKey
export ToxAddress
export ToxSavedata
export Tox_Options

###################### ToxPublicKey #####################################

immutable ToxPublicKey
	key::Vector{Uint8}
	function ToxPublicKey(public_key::Vector{Uint8})
		(length(public_key) != TOX_PUBLIC_KEY_SIZE) && throw(error("Tox API Invalid Public Key."))
		new(public_key)
	end	
end
ToxPublicKey() = ToxPublicKey(zeros(Uint8, TOX_PUBLIC_KEY_SIZE))
Base.convert(::Type{ASCIIString}, public_key::ToxPublicKey) = uppercase(bytes2hex(public_key))
Base.convert(::Type{ToxPublicKey}, key::ASCIIString) = ToxPublicKey(hex2bytes(uppercase(key)))
Base.convert(::Type{ToxPublicKey}, ptr::Ptr{UInt8})  = ToxPublicKey(pointer_to_array(ptr, TOX_PUBLIC_KEY_SIZE))


###################### ToxAddress #####################################

immutable ToxAddress
	address::Vector{Uint8}
	function ToxAddress(address::Vector{Uint8})
		if length(address) != TOX_ADDRESS_SIZE
			throw(error("Tox API Invalid Address. Address not of correct length. Is: $(length(address)), should be: $(TOX_ADDRESS:SIZE)"))
		end
		new(address)
	end
end
ToxAddress() = ToxAddress(zeros(Uint8,TOX_ADDRESS_SIZE))
Base.convert(::Type{ASCIIString}, address::ToxAddress) 	= uppercase(bytes2hex(address.address))
Base.convert(::Type{ToxAddress}, string::ASCIIString) 	= ToxAddress(hex2bytes(uppercase(string)))

###################### ToxOptions #####################################

###################### Error callback #################################
 
function tox_error_callback(tox::Ptr{Tox}, tox_function::ASCIIString, code::Uint32)
	println("Error: " + tox_function + "exited with code " + code)
end




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
	return CInterface.tox_new(C_NULL, C_NULL)
end

function tox_new(options::Tox_Options)
	return CInterface.tox_new(Ref(options), C_NULL)
end
function Tox(toxoptions=tox_options_default())
	my_tox = tox_new(toxoptions)
end
function Tox(toxfile::AbstractString, default_options=tox_options_default())
	if isfile(toxfile)
		fs 			= open(toxfile)
		savedata 	= readbytes(fs)
		close(fs)
        options = Tox_Options(default_options.ipv6_enabled,
                            default_options.udp_enabled,
                            default_options.proxy_type,
                            default_options.proxy_host,
                            default_options.proxy_port,
                            default_options.start_port,
                            default_options.end_port,
                            default_options.tcp_port,
                            TOX_SAVEDATA_TYPE_TOX_SAVE,
                            pointer(savedata),
                            length(savedata))

        return Tox(options)
	else
		error("No toxcore file at $toxfile")
	end
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
include("bootstrap.jl")
function tox_bootstrap(tox::Ptr{Tox})
	# taken from utox
	i = rand(1:(length(bootstrap_nodes)-4))
	for (url, port, key) in bootstrap_nodes[i:i+3]
		tox_bootstrap(tox, url, port, key)
    	tox_add_tcp_relay(tox, url, port, key)
	end
	true
end

function tox_bootstrap(tox::Ptr{Tox}, host::ASCIIString, port, public_key::ToxPublicKey)
	CInterface.tox_bootstrap(tox, host, port, public_key.key, C_NULL)
end
function tox_add_tcp_relay(tox::Ptr{Tox}, host::ASCIIString, port, public_key::ToxPublicKey)
	CInterface.tox_add_tcp_relay(tox, host, port, public_key.key, C_NULL)
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
	CInterface.tox_friend_add_norequest(tox, public_key.key, C_NULL)
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




#bool 	tox_file_control (Tox *tox, uint32_t friend_number, uint32_t file_number, TOX_FILE_CONTROL control, TOX_ERR_FILE_CONTROL *error)
 
#void 	tox_callback_file_recv_control (Tox *tox, tox_file_recv_control_cb *function, void *user_data)
 
#bool 	tox_file_seek (Tox *tox, uint32_t friend_number, uint32_t file_number, uint64_t position, TOX_ERR_FILE_SEEK *error)
 
#bool 	tox_file_get_file_id (const Tox *tox, uint32_t friend_number, uint32_t file_number, uint8_t *file_id, TOX_ERR_FILE_GET *error)
 

#
# tox_file_send
#

function tox_file_send(tox::Ptr{Tox}, friend_number::Uint32, kind::TOX_FILE_KIND, file_size::Integer, filename::UTF8String)
	(length(filename.data) > TOX_MAX_FILENAME_LENGTH) && throw(error("Tox API Filename to long!"))

	return CInterface.tox_file_send(tox, friend_number, kind, file_size, C_NULL, pointer(filename.data), length(filename.data), C_NULL)
end

#
# tox_file_send
#
function tox_file_send_chunk(tox::Ptr{Tox}, friend_number::Uint32, file_number::Uint32, position::Integer, data::Vector{Uint8})

	return CInterface.tox_file_send_chunk(tox, friend_number, file_number, position, data, length(data), C_NULL)
end



###################### Low-Level Callback API #####################################

typealias tox_file_chunk_request_cb_args 		(Ptr{Tox}, Uint32, Uint32, Uint64, Csize_t, Ptr{Void})
typealias tox_file_recv_cb_args 				(Ptr{Tox}, Uint32, Uint32, TOX_FILE_KIND, Uint64, Ptr{Uint8}, Csize_t, Ptr{Void})
typealias tox_file_recv_chunk_cb_args 			(Ptr{Tox}, Uint32, Uint32, Uint64, Ptr{Uint8}, Csize_t, Ptr{Void})
typealias tox_file_recv_control_cb_args 		(Ptr{Tox}, Uint32, Uint32, TOX_FILE_CONTROL, Ptr{Void})

typealias tox_friend_connection_status_cb_args 	(Ptr{Tox}, Uint32, TOX_CONNECTION, Ptr{Void})
typealias tox_friend_lossless_packet_cb_args 	(Ptr{Tox}, Uint32, Ptr{Uint8}, Csize_t, Ptr{Void})
typealias tox_friend_lossy_packet_cb_args		(Ptr{Tox}, Uint32, Ptr{Uint8}, Csize_t, Ptr{Void})
typealias tox_friend_message_cb_args 			(Ptr{Tox}, Uint32, TOX_MESSAGE_TYPE, Ptr{Uint8}, Csize_t, Ptr{Void})
typealias tox_friend_name_cb_args 				(Ptr{Tox}, Uint32, Ptr{Uint8}, Csize_t, Ptr{Void})
typealias tox_friend_read_receipt_cb_args 		(Ptr{Tox}, Uint32, Uint32, Ptr{Void})
typealias tox_friend_request_cb_args 			(Ptr{Tox}, Ptr{Uint8}, Ptr{Uint8}, Csize_t, Ptr{Void})
typealias tox_friend_status_cb_args				(Ptr{Tox}, Uint32, TOX_USER_STATUS, Ptr{Void})
typealias tox_friend_status_message_cb_args 	(Ptr{Tox}, Uint32, Ptr{Uint8}, Csize_t, Ptr{Void})
typealias tox_friend_typing_cb_args 			(Ptr{Tox}, Uint32, Bool, Ptr{Void})

typealias tox_self_connection_status_cb_args 	(Ptr{Tox}, TOX_CONNECTION, Ptr{Void})

#
# tox_callback_file_chunk_request
#
function tox_callback_file_chunk_request(tox::Ptr{Tox}, fun::Function, user_data::Ptr{Void})
	!method_exists(fun, tox_file_chunk_request_cb_args) && throw(error("Tox API Callback Error"))

	CInterface.tox_callback_file_chunk_request(tox, cfunction(fun, Void, tox_file_chunk_request_cb_args), user_data)
	nothing
end

#
# tox_callback_file_recv
#
function tox_callback_file_recv(tox::Ptr{Tox}, fun::Function, user_data::Ptr{Void})
	!method_exists(fun, tox_file_recv_cb_args) && throw(error("Tox API Callback Error"))

	CInterface.tox_callback_file_recv(tox, cfunction(fun, Void, tox_file_recv_cb_args), user_data)
	nothing
end

#
# tox_callback_file_recv_chunk
#
function tox_callback_file_recv_chunk(tox::Ptr{Tox}, fun::Function, user_data::Ptr{Void})
	!method_exists(fun, tox_file_recv_chunk_cb_args) && throw(error("Tox API Callback Error"))

	CInterface.tox_callback_file_recv_chunk(tox, cfunction(fun, Void, tox_file_recv_chunk_cb_args), user_data)
	nothing
end

#
# tox_callback_file_recv_control
#
function tox_callback_file_recv_control(tox::Ptr{Tox}, fun::Function, user_data::Ptr{Void})
	!method_exists(fun, tox_file_recv_control_cb_args) && throw(error("Tox API Callback Error"))

	CInterface.tox_callback_file_recv_control(tox, cfunction(fun, Void, tox_file_recv_control_cb_args), user_data)
	nothing
end

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



#void 	tox_callback_file_chunk_request (Tox *tox, tox_file_chunk_request_cb *function, void *user_data)
 
#void 	tox_callback_file_recv (Tox *tox, tox_file_recv_cb *function, void *user_data)
 
#void 	tox_callback_file_recv_chunk (Tox *tox, tox_file_recv_chunk_cb *function, void *user_data)#



immutable Message
    from 			::ToxUser
    text 			::UTF8String
    timestemp 		::DateTime
    Message(from, text) = new(from, text, now())
end

immutable ToxUser
	tox 			::Tox
	address 		::ToxAddress
	name 			::UTF8String
	statusmessage 	::UTF8String
	status 			::TOX_USER_STATUS
	friends 		::Vector{ToxFriend}

	avatar 			::Array{RGBA, 2}
	color 			::RGBA{Float32}
	messages 		::Dict{ToxFriend, Vector{Message}}
	signals 		::Dict{Symbol, Signal}
end



immutable ToxFriend
	id 		::UInt32
	name    ::UTF8String
end

function ToxUser(tox::Tox;
		address 		= tox_self_get_address(tox)
		name 			= tox_get_name(tox)
		statusmessage 	= "I'm available",
		status 			= CInterface.TOX_USER_STATUS_NONE,
		friends 		= tox_self_get_friend_list(tox), 
		avatar 			= RGBA{Float32}[rand(RGBA{Float32}) for i=1:64, j=1:64],
		color 			= rand(RGBA{Float32}),
		messages 		= Dict{ToxFriend, Vector{Message}}()
	)
	ToxUser(tox, address, name, statusmessage, status, friends, avatar, color, messages)
end

ToxUser(savefile::AbstractString) = Tox(savefile)
ToxUser() = Tox()


function tox_get_name(tox)
	s = tox_self_get_name_size(tox)
	name = zeros(Uint8, s)
    return bytestring(tox_self_get_name(tox, s), s)
end

function tox_self_get_name(tox,name)
    ccall((:tox_self_get_name,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,name)
end



function update(tox::ToxUser)
	tox_self_set_name(tox, info.name)
    tox_self_set_status_message(tox, info.statusmessage) 
    CInterface.tox_self_set_status(tox, info.status) 
end
