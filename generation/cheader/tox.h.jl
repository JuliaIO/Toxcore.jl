# Julia wrapper for header: cheader/tox.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function tox_version_major()
    ccall((:tox_version_major,libtoxcore),Uint32,())
end

function tox_version_minor()
    ccall((:tox_version_minor,libtoxcore),Uint32,())
end

function tox_version_patch()
    ccall((:tox_version_patch,libtoxcore),Uint32,())
end

function tox_version_is_compatible(major::Uint32,minor::Uint32,patch::Uint32)
    ccall((:tox_version_is_compatible,libtoxcore),Bool,(Uint32,Uint32,Uint32),major,minor,patch)
end

function tox_options_default(options::Ptr{Tox_Options})
    ccall((:tox_options_default,libtoxcore),Void,(Ptr{Tox_Options},),options)
end

function tox_options_new(error::Ptr{TOX_ERR_OPTIONS_NEW})
    ccall((:tox_options_new,libtoxcore),Ptr{Tox_Options},(Ptr{TOX_ERR_OPTIONS_NEW},),error)
end

function tox_options_free(options::Ptr{Tox_Options})
    ccall((:tox_options_free,libtoxcore),Void,(Ptr{Tox_Options},),options)
end

function tox_new(options::Ptr{Tox_Options},error::Ptr{TOX_ERR_NEW})
    ccall((:tox_new,libtoxcore),Ptr{Tox},(Ptr{Tox_Options},Ptr{TOX_ERR_NEW}),options,error)
end

function tox_kill(tox::Ptr{Tox})
    ccall((:tox_kill,libtoxcore),Void,(Ptr{Tox},),tox)
end

function tox_get_savedata_size(tox::Ptr{Tox})
    ccall((:tox_get_savedata_size,libtoxcore),Csize_t,(Ptr{Tox},),tox)
end

function tox_get_savedata(tox::Ptr{Tox},savedata::Ptr{Uint8})
    ccall((:tox_get_savedata,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,savedata)
end

function tox_bootstrap(tox::Ptr{Tox},address::Ptr{Uint8},port::Uint16,public_key::Ptr{Uint8},error::Ptr{TOX_ERR_BOOTSTRAP})
    ccall((:tox_bootstrap,libtoxcore),Bool,(Ptr{Tox},Ptr{Uint8},Uint16,Ptr{Uint8},Ptr{TOX_ERR_BOOTSTRAP}),tox,address,port,public_key,error)
end

function tox_add_tcp_relay(tox::Ptr{Tox},address::Ptr{Uint8},port::Uint16,public_key::Ptr{Uint8},error::Ptr{TOX_ERR_BOOTSTRAP})
    ccall((:tox_add_tcp_relay,libtoxcore),Bool,(Ptr{Tox},Ptr{Uint8},Uint16,Ptr{Uint8},Ptr{TOX_ERR_BOOTSTRAP}),tox,address,port,public_key,error)
end

function tox_self_get_connection_status(tox::Ptr{Tox})
    ccall((:tox_self_get_connection_status,libtoxcore),TOX_CONNECTION,(Ptr{Tox},),tox)
end

function tox_callback_self_connection_status(tox::Ptr{Tox},callback::Ptr{tox_self_connection_status_cb},user_data::Ptr{Void})
    ccall((:tox_callback_self_connection_status,libtoxcore),Void,(Ptr{Tox},Ptr{tox_self_connection_status_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_iteration_interval(tox::Ptr{Tox})
    ccall((:tox_iteration_interval,libtoxcore),Uint32,(Ptr{Tox},),tox)
end

function tox_iterate(tox::Ptr{Tox})
    ccall((:tox_iterate,libtoxcore),Void,(Ptr{Tox},),tox)
end

function tox_self_get_address(tox::Ptr{Tox},address::Ptr{Uint8})
    ccall((:tox_self_get_address,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,address)
end

function tox_self_set_nospam(tox::Ptr{Tox},nospam::Uint32)
    ccall((:tox_self_set_nospam,libtoxcore),Void,(Ptr{Tox},Uint32),tox,nospam)
end

function tox_self_get_nospam(tox::Ptr{Tox})
    ccall((:tox_self_get_nospam,libtoxcore),Uint32,(Ptr{Tox},),tox)
end

function tox_self_get_public_key(tox::Ptr{Tox},public_key::Ptr{Uint8})
    ccall((:tox_self_get_public_key,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,public_key)
end

function tox_self_get_secret_key(tox::Ptr{Tox},secret_key::Ptr{Uint8})
    ccall((:tox_self_get_secret_key,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,secret_key)
end

function tox_self_set_name(tox::Ptr{Tox},name::Ptr{Uint8},length::Csize_t,error::Ptr{TOX_ERR_SET_INFO})
    ccall((:tox_self_set_name,libtoxcore),Bool,(Ptr{Tox},Ptr{Uint8},Csize_t,Ptr{TOX_ERR_SET_INFO}),tox,name,length,error)
end

function tox_self_get_name_size(tox::Ptr{Tox})
    ccall((:tox_self_get_name_size,libtoxcore),Csize_t,(Ptr{Tox},),tox)
end

function tox_self_get_name(tox::Ptr{Tox},name::Ptr{Uint8})
    ccall((:tox_self_get_name,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,name)
end

function tox_self_set_status_message(tox::Ptr{Tox},status_message::Ptr{Uint8},length::Csize_t,error::Ptr{TOX_ERR_SET_INFO})
    ccall((:tox_self_set_status_message,libtoxcore),Bool,(Ptr{Tox},Ptr{Uint8},Csize_t,Ptr{TOX_ERR_SET_INFO}),tox,status_message,length,error)
end

function tox_self_get_status_message_size(tox::Ptr{Tox})
    ccall((:tox_self_get_status_message_size,libtoxcore),Csize_t,(Ptr{Tox},),tox)
end

function tox_self_get_status_message(tox::Ptr{Tox},status_message::Ptr{Uint8})
    ccall((:tox_self_get_status_message,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,status_message)
end

function tox_self_set_status(tox::Ptr{Tox},status::TOX_USER_STATUS)
    ccall((:tox_self_set_status,libtoxcore),Void,(Ptr{Tox},TOX_USER_STATUS),tox,status)
end

function tox_self_get_status(tox::Ptr{Tox})
    ccall((:tox_self_get_status,libtoxcore),TOX_USER_STATUS,(Ptr{Tox},),tox)
end

function tox_friend_add(tox::Ptr{Tox},address::Ptr{Uint8},message::Ptr{Uint8},length::Csize_t,error::Ptr{TOX_ERR_FRIEND_ADD})
    ccall((:tox_friend_add,libtoxcore),Uint32,(Ptr{Tox},Ptr{Uint8},Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FRIEND_ADD}),tox,address,message,length,error)
end

function tox_friend_add_norequest(tox::Ptr{Tox},public_key::Ptr{Uint8},error::Ptr{TOX_ERR_FRIEND_ADD})
    ccall((:tox_friend_add_norequest,libtoxcore),Uint32,(Ptr{Tox},Ptr{Uint8},Ptr{TOX_ERR_FRIEND_ADD}),tox,public_key,error)
end

function tox_friend_delete(tox::Ptr{Tox},friend_number::Uint32,error::Ptr{TOX_ERR_FRIEND_DELETE})
    ccall((:tox_friend_delete,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_DELETE}),tox,friend_number,error)
end

function tox_friend_by_public_key(tox::Ptr{Tox},public_key::Ptr{Uint8},error::Ptr{TOX_ERR_FRIEND_BY_PUBLIC_KEY})
    ccall((:tox_friend_by_public_key,libtoxcore),Uint32,(Ptr{Tox},Ptr{Uint8},Ptr{TOX_ERR_FRIEND_BY_PUBLIC_KEY}),tox,public_key,error)
end

function tox_friend_exists(tox::Ptr{Tox},friend_number::Uint32)
    ccall((:tox_friend_exists,libtoxcore),Bool,(Ptr{Tox},Uint32),tox,friend_number)
end

function tox_self_get_friend_list_size(tox::Ptr{Tox})
    ccall((:tox_self_get_friend_list_size,libtoxcore),Csize_t,(Ptr{Tox},),tox)
end

function tox_self_get_friend_list(tox::Ptr{Tox},friend_list::Ptr{Uint32})
    ccall((:tox_self_get_friend_list,libtoxcore),Void,(Ptr{Tox},Ptr{Uint32}),tox,friend_list)
end

function tox_friend_get_public_key(tox::Ptr{Tox},friend_number::Uint32,public_key::Ptr{Uint8},error::Ptr{TOX_ERR_FRIEND_GET_PUBLIC_KEY})
    ccall((:tox_friend_get_public_key,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{Uint8},Ptr{TOX_ERR_FRIEND_GET_PUBLIC_KEY}),tox,friend_number,public_key,error)
end

function tox_friend_get_last_online(tox::Ptr{Tox},friend_number::Uint32,error::Ptr{TOX_ERR_FRIEND_GET_LAST_ONLINE})
    ccall((:tox_friend_get_last_online,libtoxcore),Uint64,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_GET_LAST_ONLINE}),tox,friend_number,error)
end

function tox_friend_get_name_size(tox::Ptr{Tox},friend_number::Uint32,error::Ptr{TOX_ERR_FRIEND_QUERY})
    ccall((:tox_friend_get_name_size,libtoxcore),Csize_t,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,error)
end

function tox_friend_get_name(tox::Ptr{Tox},friend_number::Uint32,name::Ptr{Uint8},error::Ptr{TOX_ERR_FRIEND_QUERY})
    ccall((:tox_friend_get_name,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{Uint8},Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,name,error)
end

function tox_callback_friend_name(tox::Ptr{Tox},callback::Ptr{tox_friend_name_cb},user_data::Ptr{Void})
    ccall((:tox_callback_friend_name,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_name_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_friend_get_status_message_size(tox::Ptr{Tox},friend_number::Uint32,error::Ptr{TOX_ERR_FRIEND_QUERY})
    ccall((:tox_friend_get_status_message_size,libtoxcore),Csize_t,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,error)
end

function tox_friend_get_status_message(tox::Ptr{Tox},friend_number::Uint32,status_message::Ptr{Uint8},error::Ptr{TOX_ERR_FRIEND_QUERY})
    ccall((:tox_friend_get_status_message,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{Uint8},Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,status_message,error)
end

function tox_callback_friend_status_message(tox::Ptr{Tox},callback::Ptr{tox_friend_status_message_cb},user_data::Ptr{Void})
    ccall((:tox_callback_friend_status_message,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_status_message_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_friend_get_status(tox::Ptr{Tox},friend_number::Uint32,error::Ptr{TOX_ERR_FRIEND_QUERY})
    ccall((:tox_friend_get_status,libtoxcore),TOX_USER_STATUS,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,error)
end

function tox_callback_friend_status(tox::Ptr{Tox},callback::Ptr{tox_friend_status_cb},user_data::Ptr{Void})
    ccall((:tox_callback_friend_status,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_status_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_friend_get_connection_status(tox::Ptr{Tox},friend_number::Uint32,error::Ptr{TOX_ERR_FRIEND_QUERY})
    ccall((:tox_friend_get_connection_status,libtoxcore),TOX_CONNECTION,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,error)
end

function tox_callback_friend_connection_status(tox::Ptr{Tox},callback::Ptr{tox_friend_connection_status_cb},user_data::Ptr{Void})
    ccall((:tox_callback_friend_connection_status,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_connection_status_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_friend_get_typing(tox::Ptr{Tox},friend_number::Uint32,error::Ptr{TOX_ERR_FRIEND_QUERY})
    ccall((:tox_friend_get_typing,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{TOX_ERR_FRIEND_QUERY}),tox,friend_number,error)
end

function tox_callback_friend_typing(tox::Ptr{Tox},callback::Ptr{tox_friend_typing_cb},user_data::Ptr{Void})
    ccall((:tox_callback_friend_typing,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_typing_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_self_set_typing(tox::Ptr{Tox},friend_number::Uint32,typing::Bool,error::Ptr{TOX_ERR_SET_TYPING})
    ccall((:tox_self_set_typing,libtoxcore),Bool,(Ptr{Tox},Uint32,Bool,Ptr{TOX_ERR_SET_TYPING}),tox,friend_number,typing,error)
end

function tox_friend_send_message(tox::Ptr{Tox},friend_number::Uint32,_type::TOX_MESSAGE_TYPE,message::Ptr{Uint8},length::Csize_t,error::Ptr{TOX_ERR_FRIEND_SEND_MESSAGE})
    ccall((:tox_friend_send_message,libtoxcore),Uint32,(Ptr{Tox},Uint32,TOX_MESSAGE_TYPE,Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FRIEND_SEND_MESSAGE}),tox,friend_number,_type,message,length,error)
end

function tox_callback_friend_read_receipt(tox::Ptr{Tox},callback::Ptr{tox_friend_read_receipt_cb},user_data::Ptr{Void})
    ccall((:tox_callback_friend_read_receipt,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_read_receipt_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_callback_friend_request(tox::Ptr{Tox},callback::Ptr{tox_friend_request_cb},user_data::Ptr{Void})
    ccall((:tox_callback_friend_request,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_request_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_callback_friend_message(tox::Ptr{Tox},callback::Ptr{tox_friend_message_cb},user_data::Ptr{Void})
    ccall((:tox_callback_friend_message,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_message_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_hash(hash::Ptr{Uint8},data::Ptr{Uint8},length::Csize_t)
    ccall((:tox_hash,libtoxcore),Bool,(Ptr{Uint8},Ptr{Uint8},Csize_t),hash,data,length)
end

function tox_file_control(tox::Ptr{Tox},friend_number::Uint32,file_number::Uint32,control::TOX_FILE_CONTROL,error::Ptr{TOX_ERR_FILE_CONTROL})
    ccall((:tox_file_control,libtoxcore),Bool,(Ptr{Tox},Uint32,Uint32,TOX_FILE_CONTROL,Ptr{TOX_ERR_FILE_CONTROL}),tox,friend_number,file_number,control,error)
end

function tox_callback_file_recv_control(tox::Ptr{Tox},callback::Ptr{tox_file_recv_control_cb},user_data::Ptr{Void})
    ccall((:tox_callback_file_recv_control,libtoxcore),Void,(Ptr{Tox},Ptr{tox_file_recv_control_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_file_seek(tox::Ptr{Tox},friend_number::Uint32,file_number::Uint32,position::Uint64,error::Ptr{TOX_ERR_FILE_SEEK})
    ccall((:tox_file_seek,libtoxcore),Bool,(Ptr{Tox},Uint32,Uint32,Uint64,Ptr{TOX_ERR_FILE_SEEK}),tox,friend_number,file_number,position,error)
end

function tox_file_get_file_id(tox::Ptr{Tox},friend_number::Uint32,file_number::Uint32,file_id::Ptr{Uint8},error::Ptr{TOX_ERR_FILE_GET})
    ccall((:tox_file_get_file_id,libtoxcore),Bool,(Ptr{Tox},Uint32,Uint32,Ptr{Uint8},Ptr{TOX_ERR_FILE_GET}),tox,friend_number,file_number,file_id,error)
end

function tox_file_send(tox::Ptr{Tox},friend_number::Uint32,kind::Uint32,file_size::Uint64,file_id::Ptr{Uint8},filename::Ptr{Uint8},filename_length::Csize_t,error::Ptr{TOX_ERR_FILE_SEND})
    ccall((:tox_file_send,libtoxcore),Uint32,(Ptr{Tox},Uint32,Uint32,Uint64,Ptr{Uint8},Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FILE_SEND}),tox,friend_number,kind,file_size,file_id,filename,filename_length,error)
end

function tox_file_send_chunk(tox::Ptr{Tox},friend_number::Uint32,file_number::Uint32,position::Uint64,data::Ptr{Uint8},length::Csize_t,error::Ptr{TOX_ERR_FILE_SEND_CHUNK})
    ccall((:tox_file_send_chunk,libtoxcore),Bool,(Ptr{Tox},Uint32,Uint32,Uint64,Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FILE_SEND_CHUNK}),tox,friend_number,file_number,position,data,length,error)
end

function tox_callback_file_chunk_request(tox::Ptr{Tox},callback::Ptr{tox_file_chunk_request_cb},user_data::Ptr{Void})
    ccall((:tox_callback_file_chunk_request,libtoxcore),Void,(Ptr{Tox},Ptr{tox_file_chunk_request_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_callback_file_recv(tox::Ptr{Tox},callback::Ptr{tox_file_recv_cb},user_data::Ptr{Void})
    ccall((:tox_callback_file_recv,libtoxcore),Void,(Ptr{Tox},Ptr{tox_file_recv_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_callback_file_recv_chunk(tox::Ptr{Tox},callback::Ptr{tox_file_recv_chunk_cb},user_data::Ptr{Void})
    ccall((:tox_callback_file_recv_chunk,libtoxcore),Void,(Ptr{Tox},Ptr{tox_file_recv_chunk_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_friend_send_lossy_packet(tox::Ptr{Tox},friend_number::Uint32,data::Ptr{Uint8},length::Csize_t,error::Ptr{TOX_ERR_FRIEND_CUSTOM_PACKET})
    ccall((:tox_friend_send_lossy_packet,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FRIEND_CUSTOM_PACKET}),tox,friend_number,data,length,error)
end

function tox_friend_send_lossless_packet(tox::Ptr{Tox},friend_number::Uint32,data::Ptr{Uint8},length::Csize_t,error::Ptr{TOX_ERR_FRIEND_CUSTOM_PACKET})
    ccall((:tox_friend_send_lossless_packet,libtoxcore),Bool,(Ptr{Tox},Uint32,Ptr{Uint8},Csize_t,Ptr{TOX_ERR_FRIEND_CUSTOM_PACKET}),tox,friend_number,data,length,error)
end

function tox_callback_friend_lossy_packet(tox::Ptr{Tox},callback::Ptr{tox_friend_lossy_packet_cb},user_data::Ptr{Void})
    ccall((:tox_callback_friend_lossy_packet,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_lossy_packet_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_callback_friend_lossless_packet(tox::Ptr{Tox},callback::Ptr{tox_friend_lossless_packet_cb},user_data::Ptr{Void})
    ccall((:tox_callback_friend_lossless_packet,libtoxcore),Void,(Ptr{Tox},Ptr{tox_friend_lossless_packet_cb},Ptr{Void}),tox,callback,user_data)
end

function tox_self_get_dht_id(tox::Ptr{Tox},dht_id::Ptr{Uint8})
    ccall((:tox_self_get_dht_id,libtoxcore),Void,(Ptr{Tox},Ptr{Uint8}),tox,dht_id)
end

function tox_self_get_udp_port(tox::Ptr{Tox},error::Ptr{TOX_ERR_GET_PORT})
    ccall((:tox_self_get_udp_port,libtoxcore),Uint16,(Ptr{Tox},Ptr{TOX_ERR_GET_PORT}),tox,error)
end

function tox_self_get_tcp_port(tox::Ptr{Tox},error::Ptr{TOX_ERR_GET_PORT})
    ccall((:tox_self_get_tcp_port,libtoxcore),Uint16,(Ptr{Tox},Ptr{TOX_ERR_GET_PORT}),tox,error)
end

function tox_callback_group_invite(tox::Ptr{Tox},_function::Ptr{Void},userdata::Ptr{Void})
    ccall((:tox_callback_group_invite,libtoxcore),Void,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_message(tox::Ptr{Tox},_function::Ptr{Void},userdata::Ptr{Void})
    ccall((:tox_callback_group_message,libtoxcore),Void,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_action(tox::Ptr{Tox},_function::Ptr{Void},userdata::Ptr{Void})
    ccall((:tox_callback_group_action,libtoxcore),Void,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_title(tox::Ptr{Tox},_function::Ptr{Void},userdata::Ptr{Void})
    ccall((:tox_callback_group_title,libtoxcore),Void,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_namelist_change(tox::Ptr{Tox},_function::Ptr{Void},userdata::Ptr{Void})
    ccall((:tox_callback_group_namelist_change,libtoxcore),Void,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_add_groupchat(tox::Ptr{Tox})
    ccall((:tox_add_groupchat,libtoxcore),Cint,(Ptr{Tox},),tox)
end

function tox_del_groupchat(tox::Ptr{Tox},groupnumber::Cint)
    ccall((:tox_del_groupchat,libtoxcore),Cint,(Ptr{Tox},Cint),tox,groupnumber)
end

function tox_group_peername(tox::Ptr{Tox},groupnumber::Cint,peernumber::Cint,name::Ptr{Uint8})
    ccall((:tox_group_peername,libtoxcore),Cint,(Ptr{Tox},Cint,Cint,Ptr{Uint8}),tox,groupnumber,peernumber,name)
end

function tox_group_peer_pubkey(tox::Ptr{Tox},groupnumber::Cint,peernumber::Cint,public_key::Ptr{Uint8})
    ccall((:tox_group_peer_pubkey,libtoxcore),Cint,(Ptr{Tox},Cint,Cint,Ptr{Uint8}),tox,groupnumber,peernumber,public_key)
end

function tox_invite_friend(tox::Ptr{Tox},friendnumber::Int32,groupnumber::Cint)
    ccall((:tox_invite_friend,libtoxcore),Cint,(Ptr{Tox},Int32,Cint),tox,friendnumber,groupnumber)
end

function tox_join_groupchat(tox::Ptr{Tox},friendnumber::Int32,data::Ptr{Uint8},length::Uint16)
    ccall((:tox_join_groupchat,libtoxcore),Cint,(Ptr{Tox},Int32,Ptr{Uint8},Uint16),tox,friendnumber,data,length)
end

function tox_group_message_send(tox::Ptr{Tox},groupnumber::Cint,message::Ptr{Uint8},length::Uint16)
    ccall((:tox_group_message_send,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Uint8},Uint16),tox,groupnumber,message,length)
end

function tox_group_action_send(tox::Ptr{Tox},groupnumber::Cint,action::Ptr{Uint8},length::Uint16)
    ccall((:tox_group_action_send,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Uint8},Uint16),tox,groupnumber,action,length)
end

function tox_group_set_title(tox::Ptr{Tox},groupnumber::Cint,title::Ptr{Uint8},length::Uint8)
    ccall((:tox_group_set_title,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Uint8},Uint8),tox,groupnumber,title,length)
end

function tox_group_get_title(tox::Ptr{Tox},groupnumber::Cint,title::Ptr{Uint8},max_length::Uint32)
    ccall((:tox_group_get_title,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Uint8},Uint32),tox,groupnumber,title,max_length)
end

function tox_group_peernumber_is_ours(tox::Ptr{Tox},groupnumber::Cint,peernumber::Cint)
    ccall((:tox_group_peernumber_is_ours,libtoxcore),Uint32,(Ptr{Tox},Cint,Cint),tox,groupnumber,peernumber)
end

function tox_group_number_peers(tox::Ptr{Tox},groupnumber::Cint)
    ccall((:tox_group_number_peers,libtoxcore),Cint,(Ptr{Tox},Cint),tox,groupnumber)
end

function tox_group_get_names(tox::Ptr{Tox},groupnumber::Cint,names::Ptr{Array_128_Uint8},lengths::Ptr{Uint16},length::Uint16)
    ccall((:tox_group_get_names,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Array_128_Uint8},Ptr{Uint16},Uint16),tox,groupnumber,names,lengths,length)
end

function tox_count_chatlist(tox::Ptr{Tox})
    ccall((:tox_count_chatlist,libtoxcore),Uint32,(Ptr{Tox},),tox)
end

function tox_get_chatlist(tox::Ptr{Tox},out_list::Ptr{Int32},list_size::Uint32)
    ccall((:tox_get_chatlist,libtoxcore),Uint32,(Ptr{Tox},Ptr{Int32},Uint32),tox,out_list,list_size)
end

function tox_group_get_type(tox::Ptr{Tox},groupnumber::Cint)
    ccall((:tox_group_get_type,libtoxcore),Cint,(Ptr{Tox},Cint),tox,groupnumber)
end
