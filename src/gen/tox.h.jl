using Compat

export Tox, Tox_Options

immutable Tox end

typealias tox_self_connection_status_cb Void
typealias tox_friend_name_cb Void
typealias tox_friend_status_message_cb Void
typealias tox_friend_status_cb Void
typealias tox_friend_connection_status_cb Void
typealias tox_friend_typing_cb Void
typealias tox_friend_read_receipt_cb Void
typealias tox_friend_request_cb Void
typealias tox_friend_message_cb Void
typealias tox_file_recv_control_cb Void
typealias tox_file_chunk_request_cb Void
typealias tox_file_recv_cb Void
typealias tox_file_recv_chunk_cb Void
typealias tox_friend_lossy_packet_cb Void
typealias tox_friend_lossless_packet_cb Void

const TOX_VERSION_MAJOR   = 0
 
const TOX_VERSION_MINOR   = 0
 
const TOX_VERSION_PATCH   = 0
 
const TOX_PUBLIC_KEY_SIZE = 32
 
const TOX_SECRET_KEY_SIZE = 32
 
const TOX_ADDRESS_SIZE = TOX_PUBLIC_KEY_SIZE + sizeof(Uint32) + sizeof(Uint16)
 
const TOX_MAX_NAME_LENGTH = 128
 
const TOX_MAX_STATUS_MESSAGE_LENGTH = 1007
 
const TOX_MAX_FRIEND_REQUEST_LENGTH = 1016
 
const TOX_MAX_MESSAGE_LENGTH = 1372
 
const TOX_MAX_CUSTOM_PACKET_SIZE = 1373
 
const TOX_HASH_LENGTH = 32
 
const TOX_FILE_ID_LENGTH = 32
 
const TOX_MAX_FILENAME_LENGTH = 255


# begin enum TOX_USER_STATUS
typealias TOX_USER_STATUS Uint32
const TOX_USER_STATUS_NONE = @compat (UInt32)(0)
const TOX_USER_STATUS_AWAY = @compat (UInt32)(1)
const TOX_USER_STATUS_BUSY = @compat (UInt32)(2)
# end enum TOX_USER_STATUS

# begin enum TOX_MESSAGE_TYPE
typealias TOX_MESSAGE_TYPE Uint32
const TOX_MESSAGE_TYPE_NORMAL = @compat (UInt32)(0)
const TOX_MESSAGE_TYPE_ACTION = @compat (UInt32)(1)
# end enum TOX_MESSAGE_TYPE

# begin enum TOX_PROXY_TYPE
typealias TOX_PROXY_TYPE Uint32
const TOX_PROXY_TYPE_NONE = @compat (UInt32)(0)
const TOX_PROXY_TYPE_HTTP = @compat (UInt32)(1)
const TOX_PROXY_TYPE_SOCKS5 = @compat (UInt32)(2)
# end enum TOX_PROXY_TYPE

# begin enum TOX_ERR_OPTIONS_NEW
typealias TOX_ERR_OPTIONS_NEW Uint32
const TOX_ERR_OPTIONS_NEW_OK = @compat (UInt32)(0)
const TOX_ERR_OPTIONS_NEW_MALLOC = @compat (UInt32)(1)
# end enum TOX_ERR_OPTIONS_NEW

# begin enum TOX_ERR_NEW
typealias TOX_ERR_NEW Uint32
const TOX_ERR_NEW_OK = @compat (UInt32)(0)
const TOX_ERR_NEW_NULL = @compat (UInt32)(1)
const TOX_ERR_NEW_MALLOC = @compat (UInt32)(2)
const TOX_ERR_NEW_PORT_ALLOC = @compat (UInt32)(3)
const TOX_ERR_NEW_PROXY_BAD_TYPE = @compat (UInt32)(4)
const TOX_ERR_NEW_PROXY_BAD_HOST = @compat (UInt32)(5)
const TOX_ERR_NEW_PROXY_BAD_PORT = @compat (UInt32)(6)
const TOX_ERR_NEW_PROXY_NOT_FOUND = @compat (UInt32)(7)
const TOX_ERR_NEW_LOAD_ENCRYPTED = @compat (UInt32)(8)
const TOX_ERR_NEW_LOAD_BAD_FORMAT = @compat (UInt32)(9)
# end enum TOX_ERR_NEW

# begin enum TOX_ERR_BOOTSTRAP
typealias TOX_ERR_BOOTSTRAP Uint32
const TOX_ERR_BOOTSTRAP_OK = @compat (UInt32)(0)
const TOX_ERR_BOOTSTRAP_NULL = @compat (UInt32)(1)
const TOX_ERR_BOOTSTRAP_BAD_HOST = @compat (UInt32)(2)
const TOX_ERR_BOOTSTRAP_BAD_PORT = @compat (UInt32)(3)
# end enum TOX_ERR_BOOTSTRAP

# begin enum TOX_CONNECTION
typealias TOX_CONNECTION Uint32
const TOX_CONNECTION_NONE = @compat (UInt32)(0)
const TOX_CONNECTION_TCP = @compat (UInt32)(1)
const TOX_CONNECTION_UDP = @compat (UInt32)(2)
# end enum TOX_CONNECTION

# begin enum TOX_ERR_SET_INFO
typealias TOX_ERR_SET_INFO Uint32
const TOX_ERR_SET_INFO_OK = @compat (UInt32)(0)
const TOX_ERR_SET_INFO_NULL = @compat (UInt32)(1)
const TOX_ERR_SET_INFO_TOO_LONG = @compat (UInt32)(2)
# end enum TOX_ERR_SET_INFO

# begin enum TOX_ERR_FRIEND_ADD
typealias TOX_ERR_FRIEND_ADD Uint32
const TOX_ERR_FRIEND_ADD_OK = @compat (UInt32)(0)
const TOX_ERR_FRIEND_ADD_NULL = @compat (UInt32)(1)
const TOX_ERR_FRIEND_ADD_TOO_LONG = @compat (UInt32)(2)
const TOX_ERR_FRIEND_ADD_NO_MESSAGE = @compat (UInt32)(3)
const TOX_ERR_FRIEND_ADD_OWN_KEY = @compat (UInt32)(4)
const TOX_ERR_FRIEND_ADD_ALREADY_SENT = @compat (UInt32)(5)
const TOX_ERR_FRIEND_ADD_BAD_CHECKSUM = @compat (UInt32)(6)
const TOX_ERR_FRIEND_ADD_SET_NEW_NOSPAM = @compat (UInt32)(7)
const TOX_ERR_FRIEND_ADD_MALLOC = @compat (UInt32)(8)
# end enum TOX_ERR_FRIEND_ADD

# begin enum TOX_ERR_FRIEND_DELETE
typealias TOX_ERR_FRIEND_DELETE Uint32
const TOX_ERR_FRIEND_DELETE_OK = @compat (UInt32)(0)
const TOX_ERR_FRIEND_DELETE_FRIEND_NOT_FOUND = @compat (UInt32)(1)
# end enum TOX_ERR_FRIEND_DELETE

# begin enum TOX_ERR_FRIEND_BY_PUBLIC_KEY
typealias TOX_ERR_FRIEND_BY_PUBLIC_KEY Uint32
const TOX_ERR_FRIEND_BY_PUBLIC_KEY_OK = @compat (UInt32)(0)
const TOX_ERR_FRIEND_BY_PUBLIC_KEY_NULL = @compat (UInt32)(1)
const TOX_ERR_FRIEND_BY_PUBLIC_KEY_NOT_FOUND = @compat (UInt32)(2)
# end enum TOX_ERR_FRIEND_BY_PUBLIC_KEY

# begin enum TOX_ERR_FRIEND_GET_PUBLIC_KEY
typealias TOX_ERR_FRIEND_GET_PUBLIC_KEY Uint32
const TOX_ERR_FRIEND_GET_PUBLIC_KEY_OK = @compat (UInt32)(0)
const TOX_ERR_FRIEND_GET_PUBLIC_KEY_FRIEND_NOT_FOUND = @compat (UInt32)(1)
# end enum TOX_ERR_FRIEND_GET_PUBLIC_KEY

# begin enum TOX_ERR_FRIEND_GET_LAST_ONLINE
typealias TOX_ERR_FRIEND_GET_LAST_ONLINE Uint32
const TOX_ERR_FRIEND_GET_LAST_ONLINE_OK = @compat (UInt32)(0)
const TOX_ERR_FRIEND_GET_LAST_ONLINE_FRIEND_NOT_FOUND = @compat (UInt32)(1)
# end enum TOX_ERR_FRIEND_GET_LAST_ONLINE

# begin enum TOX_ERR_FRIEND_QUERY
typealias TOX_ERR_FRIEND_QUERY Uint32
const TOX_ERR_FRIEND_QUERY_OK = @compat (UInt32)(0)
const TOX_ERR_FRIEND_QUERY_NULL = @compat (UInt32)(1)
const TOX_ERR_FRIEND_QUERY_FRIEND_NOT_FOUND = @compat (UInt32)(2)
# end enum TOX_ERR_FRIEND_QUERY

# begin enum TOX_ERR_SET_TYPING
typealias TOX_ERR_SET_TYPING Uint32
const TOX_ERR_SET_TYPING_OK = @compat (UInt32)(0)
const TOX_ERR_SET_TYPING_FRIEND_NOT_FOUND = @compat (UInt32)(1)
# end enum TOX_ERR_SET_TYPING

# begin enum TOX_ERR_FRIEND_SEND_MESSAGE
typealias TOX_ERR_FRIEND_SEND_MESSAGE Uint32
const TOX_ERR_FRIEND_SEND_MESSAGE_OK = @compat (UInt32)(0)
const TOX_ERR_FRIEND_SEND_MESSAGE_NULL = @compat (UInt32)(1)
const TOX_ERR_FRIEND_SEND_MESSAGE_FRIEND_NOT_FOUND = @compat (UInt32)(2)
const TOX_ERR_FRIEND_SEND_MESSAGE_FRIEND_NOT_CONNECTED = @compat (UInt32)(3)
const TOX_ERR_FRIEND_SEND_MESSAGE_SENDQ = @compat (UInt32)(4)
const TOX_ERR_FRIEND_SEND_MESSAGE_TOO_LONG = @compat (UInt32)(5)
const TOX_ERR_FRIEND_SEND_MESSAGE_EMPTY = @compat (UInt32)(6)
# end enum TOX_ERR_FRIEND_SEND_MESSAGE

# begin enum TOX_FILE_KIND
typealias TOX_FILE_KIND Uint32
const TOX_FILE_KIND_DATA = @compat (UInt32)(0)
const TOX_FILE_KIND_AVATAR = @compat (UInt32)(1)
# end enum TOX_FILE_KIND

# begin enum TOX_FILE_CONTROL
typealias TOX_FILE_CONTROL Uint32
const TOX_FILE_CONTROL_RESUME = @compat (UInt32)(0)
const TOX_FILE_CONTROL_PAUSE = @compat (UInt32)(1)
const TOX_FILE_CONTROL_CANCEL = @compat (UInt32)(2)
# end enum TOX_FILE_CONTROL

# begin enum TOX_ERR_FILE_CONTROL
typealias TOX_ERR_FILE_CONTROL Uint32
const TOX_ERR_FILE_CONTROL_OK = @compat (UInt32)(0)
const TOX_ERR_FILE_CONTROL_FRIEND_NOT_FOUND = @compat (UInt32)(1)
const TOX_ERR_FILE_CONTROL_FRIEND_NOT_CONNECTED = @compat (UInt32)(2)
const TOX_ERR_FILE_CONTROL_NOT_FOUND = @compat (UInt32)(3)
const TOX_ERR_FILE_CONTROL_NOT_PAUSED = @compat (UInt32)(4)
const TOX_ERR_FILE_CONTROL_DENIED = @compat (UInt32)(5)
const TOX_ERR_FILE_CONTROL_ALREADY_PAUSED = @compat (UInt32)(6)
const TOX_ERR_FILE_CONTROL_SENDQ = @compat (UInt32)(7)
# end enum TOX_ERR_FILE_CONTROL

# begin enum TOX_ERR_FILE_SEEK
typealias TOX_ERR_FILE_SEEK Uint32
const TOX_ERR_FILE_SEEK_OK = @compat (UInt32)(0)
const TOX_ERR_FILE_SEEK_FRIEND_NOT_FOUND = @compat (UInt32)(1)
const TOX_ERR_FILE_SEEK_FRIEND_NOT_CONNECTED = @compat (UInt32)(2)
const TOX_ERR_FILE_SEEK_NOT_FOUND = @compat (UInt32)(3)
const TOX_ERR_FILE_SEEK_DENIED = @compat (UInt32)(4)
const TOX_ERR_FILE_SEEK_INVALID_POSITION = @compat (UInt32)(5)
const TOX_ERR_FILE_SEEK_SENDQ = @compat (UInt32)(6)
# end enum TOX_ERR_FILE_SEEK

# begin enum TOX_ERR_FILE_GET
typealias TOX_ERR_FILE_GET Uint32
const TOX_ERR_FILE_GET_OK = @compat (UInt32)(0)
const TOX_ERR_FILE_GET_FRIEND_NOT_FOUND = @compat (UInt32)(1)
const TOX_ERR_FILE_GET_NOT_FOUND = @compat (UInt32)(2)
# end enum TOX_ERR_FILE_GET

# begin enum TOX_ERR_FILE_SEND
typealias TOX_ERR_FILE_SEND Uint32
const TOX_ERR_FILE_SEND_OK = @compat (UInt32)(0)
const TOX_ERR_FILE_SEND_NULL = @compat (UInt32)(1)
const TOX_ERR_FILE_SEND_FRIEND_NOT_FOUND = @compat (UInt32)(2)
const TOX_ERR_FILE_SEND_FRIEND_NOT_CONNECTED = @compat (UInt32)(3)
const TOX_ERR_FILE_SEND_NAME_TOO_LONG = @compat (UInt32)(4)
const TOX_ERR_FILE_SEND_TOO_MANY = @compat (UInt32)(5)
# end enum TOX_ERR_FILE_SEND

# begin enum TOX_ERR_FILE_SEND_CHUNK
typealias TOX_ERR_FILE_SEND_CHUNK Uint32
const TOX_ERR_FILE_SEND_CHUNK_OK = @compat (UInt32)(0)
const TOX_ERR_FILE_SEND_CHUNK_NULL = @compat (UInt32)(1)
const TOX_ERR_FILE_SEND_CHUNK_FRIEND_NOT_FOUND = @compat (UInt32)(2)
const TOX_ERR_FILE_SEND_CHUNK_FRIEND_NOT_CONNECTED = @compat (UInt32)(3)
const TOX_ERR_FILE_SEND_CHUNK_NOT_FOUND = @compat (UInt32)(4)
const TOX_ERR_FILE_SEND_CHUNK_NOT_TRANSFERRING = @compat (UInt32)(5)
const TOX_ERR_FILE_SEND_CHUNK_INVALID_LENGTH = @compat (UInt32)(6)
const TOX_ERR_FILE_SEND_CHUNK_SENDQ = @compat (UInt32)(7)
const TOX_ERR_FILE_SEND_CHUNK_WRONG_POSITION = @compat (UInt32)(8)
# end enum TOX_ERR_FILE_SEND_CHUNK

# begin enum TOX_ERR_FRIEND_CUSTOM_PACKET
typealias TOX_ERR_FRIEND_CUSTOM_PACKET Uint32
const TOX_ERR_FRIEND_CUSTOM_PACKET_OK = @compat (UInt32)(0)
const TOX_ERR_FRIEND_CUSTOM_PACKET_NULL = @compat (UInt32)(1)
const TOX_ERR_FRIEND_CUSTOM_PACKET_FRIEND_NOT_FOUND = @compat (UInt32)(2)
const TOX_ERR_FRIEND_CUSTOM_PACKET_FRIEND_NOT_CONNECTED = @compat (UInt32)(3)
const TOX_ERR_FRIEND_CUSTOM_PACKET_INVALID = @compat (UInt32)(4)
const TOX_ERR_FRIEND_CUSTOM_PACKET_EMPTY = @compat (UInt32)(5)
const TOX_ERR_FRIEND_CUSTOM_PACKET_TOO_LONG = @compat (UInt32)(6)
const TOX_ERR_FRIEND_CUSTOM_PACKET_SENDQ = @compat (UInt32)(7)
# end enum TOX_ERR_FRIEND_CUSTOM_PACKET

# begin enum TOX_ERR_GET_PORT
typealias TOX_ERR_GET_PORT Uint32
const TOX_ERR_GET_PORT_OK = @compat (UInt32)(0)
const TOX_ERR_GET_PORT_NOT_BOUND = @compat (UInt32)(1)
# end enum TOX_ERR_GET_PORT

immutable Tox_Options
    ipv6_enabled::Bool
    udp_enabled::Bool
    proxy_type::TOX_PROXY_TYPE
    proxy_host::Ptr{Cchar}
    proxy_port::Uint16
    start_port::Uint16
    end_port::Uint16
    Tox_Options() = new()
end

immutable Array_128_Uint8
    d1::Uint8
    d2::Uint8
    d3::Uint8
    d4::Uint8
    d5::Uint8
    d6::Uint8
    d7::Uint8
    d8::Uint8
    d9::Uint8
    d10::Uint8
    d11::Uint8
    d12::Uint8
    d13::Uint8
    d14::Uint8
    d15::Uint8
    d16::Uint8
    d17::Uint8
    d18::Uint8
    d19::Uint8
    d20::Uint8
    d21::Uint8
    d22::Uint8
    d23::Uint8
    d24::Uint8
    d25::Uint8
    d26::Uint8
    d27::Uint8
    d28::Uint8
    d29::Uint8
    d30::Uint8
    d31::Uint8
    d32::Uint8
    d33::Uint8
    d34::Uint8
    d35::Uint8
    d36::Uint8
    d37::Uint8
    d38::Uint8
    d39::Uint8
    d40::Uint8
    d41::Uint8
    d42::Uint8
    d43::Uint8
    d44::Uint8
    d45::Uint8
    d46::Uint8
    d47::Uint8
    d48::Uint8
    d49::Uint8
    d50::Uint8
    d51::Uint8
    d52::Uint8
    d53::Uint8
    d54::Uint8
    d55::Uint8
    d56::Uint8
    d57::Uint8
    d58::Uint8
    d59::Uint8
    d60::Uint8
    d61::Uint8
    d62::Uint8
    d63::Uint8
    d64::Uint8
    d65::Uint8
    d66::Uint8
    d67::Uint8
    d68::Uint8
    d69::Uint8
    d70::Uint8
    d71::Uint8
    d72::Uint8
    d73::Uint8
    d74::Uint8
    d75::Uint8
    d76::Uint8
    d77::Uint8
    d78::Uint8
    d79::Uint8
    d80::Uint8
    d81::Uint8
    d82::Uint8
    d83::Uint8
    d84::Uint8
    d85::Uint8
    d86::Uint8
    d87::Uint8
    d88::Uint8
    d89::Uint8
    d90::Uint8
    d91::Uint8
    d92::Uint8
    d93::Uint8
    d94::Uint8
    d95::Uint8
    d96::Uint8
    d97::Uint8
    d98::Uint8
    d99::Uint8
    d100::Uint8
    d101::Uint8
    d102::Uint8
    d103::Uint8
    d104::Uint8
    d105::Uint8
    d106::Uint8
    d107::Uint8
    d108::Uint8
    d109::Uint8
    d110::Uint8
    d111::Uint8
    d112::Uint8
    d113::Uint8
    d114::Uint8
    d115::Uint8
    d116::Uint8
    d117::Uint8
    d118::Uint8
    d119::Uint8
    d120::Uint8
    d121::Uint8
    d122::Uint8
    d123::Uint8
    d124::Uint8
    d125::Uint8
    d126::Uint8
    d127::Uint8
    d128::Uint8
end

function tox_version_major()
    ccall((:tox_version_major,libtoxcore),Uint32,())
end

function tox_version_minor()
    ccall((:tox_version_minor,libtoxcore),Uint32,())
end

function tox_version_patch()
    ccall((:tox_version_patch,libtoxcore),Uint32,())
end

function tox_version_is_compatible(major,minor,patch)
    ccall((:tox_version_is_compatible,libtoxcore),Bool,(Uint32,Uint32,Uint32),major,minor,patch)
end

function tox_options_default(options)
    ccall((:tox_options_default,libtoxcore),Void,(Ptr{Tox_Options},),options)
end

function tox_options_new(error)
    ccall((:tox_options_new,libtoxcore),Ptr{Tox_Options},(Ptr{TOX_ERR_OPTIONS_NEW},),error)
end

function tox_options_free(options)
    ccall((:tox_options_free,libtoxcore),Void,(Ptr{Tox_Options},),options)
end

function tox_new(options,data,length,error)
    ccall((:tox_new,libtoxcore),Ptr{Tox},(Ptr{Tox_Options},Ptr{Uint8},Csize_t,Ptr{TOX_ERR_NEW}),options,data,length,error)
end

function tox_kill(tox)
    ccall((:tox_kill,libtoxcore),Void,(Ptr{Tox},),tox)
end

function tox_get_savedata_size(tox)
    ccall((:tox_get_savedata_size,libtoxcore),Csize_t,(Ptr{Tox},),tox)
end

function tox_get_savedata(tox,dataconst )
    ccall((:tox_get_savedata,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,data)
end

function tox_bootstrap(tox,host,port,public_key,error)
    ccall((:tox_bootstrap,libtoxcore),Bool,(Ptr{Tox},Ptr{Uint8},Uint16,Ptr{Uint8},Ptr{TOX_ERR_BOOTSTRAP}),tox,host,port,public_key,error)
end

function tox_add_tcp_relay(tox,host,port,public_key,error)
    ccall((:tox_add_tcp_relay,libtoxcore),Bool,(Ptr{Tox},Ptr{Uint8},Uint16,Ptr{Uint8},Ptr{TOX_ERR_BOOTSTRAP}),tox,host,port,public_key,error)
end

function tox_self_get_connection_status(tox)
    ccall((:tox_self_get_connection_status,libtoxcore),TOX_CONNECTION,(Ptr{Tox},),tox)
end

function tox_callback_self_connection_status(tox,_function,user_data)
    ccall((:tox_callback_self_connection_status,libtoxcore),Void,(Ptr{Tox},Ptr{tox_self_connection_status_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_iteration_interval(tox)
    ccall((:tox_iteration_interval,libtoxcore),Uint32,(Ptr{Tox},),tox)
end

function tox_iterate(tox)
    ccall((:tox_iterate,libtoxcore),Void,(Ptr{Tox},),tox)
end

function tox_self_get_address(tox,address)
    ccall((:tox_self_get_address,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,address)
end

function tox_self_set_nospam(tox,nospam)
    ccall((:tox_self_set_nospam,libtoxcore),Void,(Ptr{Tox},Uint32),tox,nospam)
end

function tox_self_get_nospam(tox)
    ccall((:tox_self_get_nospam,libtoxcore),Uint32,(Ptr{Tox},),tox)
end

function tox_self_get_public_key(tox,public_key)
    ccall((:tox_self_get_public_key,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,public_key)
end

function tox_self_get_secret_key(tox,secret_key)
    ccall((:tox_self_get_secret_key,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,secret_key)
end

function tox_self_set_name(tox,name,length,error)
    ccall((:tox_self_set_name,libtoxcore),Bool,(Ptr{Tox},Ptr{Uint8},Csize_t,Ptr{TOX_ERR_SET_INFO}),tox,name,length,error)
end

function tox_self_get_name_size(tox)
    ccall((:tox_self_get_name_size,libtoxcore),Csize_t,(Ptr{Tox},),tox)
end

function tox_self_get_name(tox,name)
    ccall((:tox_self_get_name,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,name)
end

function tox_self_set_status_message(tox,status,length,error)
    ccall((:tox_self_set_status_message,libtoxcore),Bool,(Ptr{Tox},Ptr{Uint8},Csize_t,Ptr{TOX_ERR_SET_INFO}),tox,status,length,error)
end

function tox_self_get_status_message_size(tox)
    ccall((:tox_self_get_status_message_size,libtoxcore),Csize_t,(Ptr{Tox},),tox)
end

function tox_self_get_status_message(tox,status)
    ccall((:tox_self_get_status_message,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,status)
end

function tox_self_set_status(tox,user_status)
    ccall((:tox_self_set_status,libtoxcore),Void,(Ptr{Tox},TOX_USER_STATUS),tox,user_status)
end

function tox_self_get_status(tox)
    ccall((:tox_self_get_status,libtoxcore),TOX_USER_STATUS,(Ptr{Tox},),tox)
end

function tox_friend_add(tox,address,message,length,error)
    ccall((:tox_friend_add,libtoxcore),Uint32,(Ptr{Tox},Ptr{Uint8},Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FRIEND_ADD}),tox,address,message,length,error)
end

function tox_friend_add_norequest(tox,public_key,error)
    ccall((:tox_friend_add_norequest,libtoxcore),Uint32,(Ptr{Tox},Ptr{Uint8},Ptr{TOX_ERR_FRIEND_ADD}),tox,public_key,error)
end

function tox_friend_delete(tox,friend_number,error)
    ccall((:tox_friend_delete,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_DELETE}),tox,friend_number,error)
end

function tox_friend_by_public_key(tox,public_key,error)
    ccall((:tox_friend_by_public_key,libtoxcore),Uint32,(Ptr{Tox},Ptr{Uint8},Ptr{TOX_ERR_FRIEND_BY_PUBLIC_KEY}),tox,public_key,error)
end

function tox_friend_get_public_key(tox,friend_number,public_key,error)
    ccall((:tox_friend_get_public_key,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{Uint8},Ptr{TOX_ERR_FRIEND_GET_PUBLIC_KEY}),tox,friend_number,public_key,error)
end

function tox_friend_exists(tox,friend_number)
    ccall((:tox_friend_exists,libtoxcore),Bool,(Ptr{Tox},Uint32),tox,friend_number)
end

function tox_friend_get_last_online(tox,friend_number,error)
    ccall((:tox_friend_get_last_online,libtoxcore),Uint64,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_GET_LAST_ONLINE}),tox,friend_number,error)
end

function tox_self_get_friend_list_size(tox)
    ccall((:tox_self_get_friend_list_size,libtoxcore),Csize_t,(Ptr{Tox},),tox)
end

function tox_self_get_friend_list(tox,list)
    ccall((:tox_self_get_friend_list,libtoxcore),Void,(Ptr{Tox},Ptr{Uint32}),tox,list)
end

function tox_friend_get_name_size(tox,friend_number,error)
    ccall((:tox_friend_get_name_size,libtoxcore),Csize_t,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,error)
end

function tox_friend_get_name(tox,friend_number,name,error)
    ccall((:tox_friend_get_name,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{Uint8},Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,name,error)
end

function tox_callback_friend_name(tox,_function,user_data)
    ccall((:tox_callback_friend_name,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_name_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_friend_get_status_message_size(tox,friend_number,error)
    ccall((:tox_friend_get_status_message_size,libtoxcore),Csize_t,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,error)
end

function tox_friend_get_status_message(tox,friend_number,message,error)
    ccall((:tox_friend_get_status_message,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{Uint8},Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,message,error)
end

function tox_callback_friend_status_message(tox,_function,user_data)
    ccall((:tox_callback_friend_status_message,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_status_message_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_friend_get_status(tox,friend_number,error)
    ccall((:tox_friend_get_status,libtoxcore),TOX_USER_STATUS,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,error)
end

function tox_callback_friend_status(tox,_function,user_data)
    ccall((:tox_callback_friend_status,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_status_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_friend_get_connection_status(tox,friend_number,error)
    ccall((:tox_friend_get_connection_status,libtoxcore),TOX_CONNECTION,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,error)
end

function tox_callback_friend_connection_status(tox,_function,user_data)
    ccall((:tox_callback_friend_connection_status,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_connection_status_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_friend_get_typing(tox,friend_number,error)
    ccall((:tox_friend_get_typing,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,error)
end

function tox_callback_friend_typing(tox,_function,user_data)
    ccall((:tox_callback_friend_typing,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_typing_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_self_set_typing(tox,friend_number,is_typing,error)
    ccall((:tox_self_set_typing,libtoxcore),Bool,(Ptr{Tox},Uint32,Bool,Ptr{TOX_ERR_SET_TYPING}),tox,friend_number,is_typing,error)
end

function tox_friend_send_message(tox,friend_number,_type,message,length,error)
    ccall((:tox_friend_send_message,libtoxcore),Uint32,(Ptr{Tox},Uint32,TOX_MESSAGE_TYPE,Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FRIEND_SEND_MESSAGE}),tox,friend_number,_type,message,length,error)
end

function tox_callback_friend_read_receipt(tox,_function,user_data)
    ccall((:tox_callback_friend_read_receipt,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_read_receipt_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_callback_friend_request(tox,_function,user_data)
    ccall((:tox_callback_friend_request,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_request_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_callback_friend_message(tox,_function,user_data)
    ccall((:tox_callback_friend_message,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_message_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_hash(hash,data,length)
    ccall((:tox_hash,libtoxcore),Bool,(Ptr{Uint8},Ptr{Uint8},Csize_t),hash,data,length)
end

function tox_file_control(tox,friend_number,file_number,control,error)
    ccall((:tox_file_control,libtoxcore),Bool,(Ptr{Tox},Uint32,Uint32,TOX_FILE_CONTROL,Ptr{TOX_ERR_FILE_CONTROL}),tox,friend_number,file_number,control,error)
end

function tox_callback_file_recv_control(tox,_function,user_data)
    ccall((:tox_callback_file_recv_control,libtoxcore),Void,(Ptr{Tox},Ptr{tox_file_recv_control_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_file_seek(tox,friend_number,file_number,position,error)
    ccall((:tox_file_seek,libtoxcore),Bool,(Ptr{Tox},Uint32,Uint32,Uint64,Ptr{TOX_ERR_FILE_SEEK}),tox,friend_number,file_number,position,error)
end

function tox_file_get_file_id(tox,friend_number,file_number,file_id,error)
    ccall((:tox_file_get_file_id,libtoxcore),Bool,(Ptr{Tox},Uint32,Uint32,Ptr{Uint8},Ptr{TOX_ERR_FILE_GET}),tox,friend_number,file_number,file_id,error)
end

function tox_file_send(tox,friend_number,kind,file_size,file_id,filename,filename_length,error)
    ccall((:tox_file_send,libtoxcore),Uint32,(Ptr{Tox},Uint32,Uint32,Uint64,Ptr{Uint8},Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FILE_SEND}),tox,friend_number,kind,file_size,file_id,filename,filename_length,error)
end

function tox_file_send_chunk(tox,friend_number,file_number,position,data,length,error)
    ccall((:tox_file_send_chunk,libtoxcore),Bool,(Ptr{Tox},Uint32,Uint32,Uint64,Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FILE_SEND_CHUNK}),tox,friend_number,file_number,position,data,length,error)
end

function tox_callback_file_chunk_request(tox,_function,user_data)
    ccall((:tox_callback_file_chunk_request,libtoxcore),Void,(Ptr{Tox},Ptr{tox_file_chunk_request_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_callback_file_recv(tox,_function,user_data)
    ccall((:tox_callback_file_recv,libtoxcore),Void,(Ptr{Tox},Ptr{tox_file_recv_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_callback_file_recv_chunk(tox,_function,user_data)
    ccall((:tox_callback_file_recv_chunk,libtoxcore),Void,(Ptr{Tox},Ptr{tox_file_recv_chunk_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_friend_send_lossy_packet(tox,friend_number,data,length,error)
    ccall((:tox_friend_send_lossy_packet,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FRIEND_CUSTOM_PACKET}),tox,friend_number,data,length,error)
end

function tox_callback_friend_lossy_packet(tox,_function,user_data)
    ccall((:tox_callback_friend_lossy_packet,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_lossy_packet_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_friend_send_lossless_packet(tox,friend_number,data,length,error)
    ccall((:tox_friend_send_lossless_packet,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FRIEND_CUSTOM_PACKET}),tox,friend_number,data,length,error)
end

function tox_callback_friend_lossless_packet(tox,_function,user_data)
    ccall((:tox_callback_friend_lossless_packet,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_lossless_packet_cb},Ptr{Void}),tox,_function,user_data)
end

function tox_self_get_dht_id(tox,dht_id)
    ccall((:tox_self_get_dht_id,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,dht_id)
end

function tox_self_get_udp_port(tox,error)
    ccall((:tox_self_get_udp_port,libtoxcore),Uint16,(Ptr{Tox},Ptr{TOX_ERR_GET_PORT}),tox,error)
end

function tox_self_get_tcp_port(tox,error)
    ccall((:tox_self_get_tcp_port,libtoxcore),Uint16,(Ptr{Tox},Ptr{TOX_ERR_GET_PORT}),tox,error)
end

function tox_callback_group_invite(tox,_function,userdata)
    ccall((:tox_callback_group_invite,libtoxcore),Void,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_message(tox,_function,userdata)
    ccall((:tox_callback_group_message,libtoxcore),Void,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_action(tox,_function,userdata)
    ccall((:tox_callback_group_action,libtoxcore),Void,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_title(tox,_function,userdata)
    ccall((:tox_callback_group_title,libtoxcore),Void,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_namelist_change(tox,_function,userdata)
    ccall((:tox_callback_group_namelist_change,libtoxcore),Void,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_add_groupchat(tox)
    ccall((:tox_add_groupchat,libtoxcore),Cint,(Ptr{Tox},),tox)
end

function tox_del_groupchat(tox,groupnumber)
    ccall((:tox_del_groupchat,libtoxcore),Cint,(Ptr{Tox},Cint),tox,groupnumber)
end

function tox_group_peername(tox,groupnumber,peernumber,name)
    ccall((:tox_group_peername,libtoxcore),Cint,(Ptr{Tox},Cint,Cint,Ptr{Uint8}),tox,groupnumber,peernumber,name)
end

function tox_group_peer_pubkey(tox,groupnumber,peernumber,public_key)
    ccall((:tox_group_peer_pubkey,libtoxcore),Cint,(Ptr{Tox},Cint,Cint,Ptr{Uint8}),tox,groupnumber,peernumber,public_key)
end

function tox_invite_friend(tox,friendnumber,groupnumber)
    ccall((:tox_invite_friend,libtoxcore),Cint,(Ptr{Tox},Int32,Cint),tox,friendnumber,groupnumber)
end

function tox_join_groupchat(tox,friendnumber,data,length)
    ccall((:tox_join_groupchat,libtoxcore),Cint,(Ptr{Tox},Int32,Ptr{Uint8},Uint16),tox,friendnumber,data,length)
end

function tox_group_message_send(tox,groupnumber,message,length)
    ccall((:tox_group_message_send,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Uint8},Uint16),tox,groupnumber,message,length)
end

function tox_group_action_send(tox,groupnumber,action,length)
    ccall((:tox_group_action_send,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Uint8},Uint16),tox,groupnumber,action,length)
end

function tox_group_set_title(tox,groupnumber,title,length)
    ccall((:tox_group_set_title,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Uint8},Uint8),tox,groupnumber,title,length)
end

function tox_group_get_title(tox,groupnumber,title,max_length)
    ccall((:tox_group_get_title,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Uint8},Uint32),tox,groupnumber,title,max_length)
end

function tox_group_peernumber_is_ours(tox,groupnumber,peernumber)
    ccall((:tox_group_peernumber_is_ours,libtoxcore),Uint32,(Ptr{Tox},Cint,Cint),tox,groupnumber,peernumber)
end

function tox_group_number_peers(tox,groupnumber)
    ccall((:tox_group_number_peers,libtoxcore),Cint,(Ptr{Tox},Cint),tox,groupnumber)
end

function tox_group_get_names(tox,groupnumber,names,lengths,length)
    ccall((:tox_group_get_names,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Array_128_Uint8},Ptr{Uint16},Uint16),tox,groupnumber,names,lengths,length)
end

function tox_count_chatlist(tox)
    ccall((:tox_count_chatlist,libtoxcore),Uint32,(Ptr{Tox},),tox)
end

function tox_get_chatlist(tox,out_list,list_size)
    ccall((:tox_get_chatlist,libtoxcore),Uint32,(Ptr{Tox},Ptr{Int32},Uint32),tox,out_list,list_size)
end

function tox_group_get_type(tox,groupnumber)
    ccall((:tox_group_get_type,libtoxcore),Cint,(Ptr{Tox},Cint),tox,groupnumber)
end