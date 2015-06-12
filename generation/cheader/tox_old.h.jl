# Julia wrapper for header: cheader/tox_old.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function tox_callback_group_invite(tox::Ptr{Cint},_function::Ptr{Void},userdata::Ptr{Void})
    ccall((:tox_callback_group_invite,libtoxcore),Void,(Ptr{Cint},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_message(tox::Ptr{Cint},_function::Ptr{Void},userdata::Ptr{Void})
    ccall((:tox_callback_group_message,libtoxcore),Void,(Ptr{Cint},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_action(tox::Ptr{Cint},_function::Ptr{Void},userdata::Ptr{Void})
    ccall((:tox_callback_group_action,libtoxcore),Void,(Ptr{Cint},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_title(tox::Ptr{Cint},_function::Ptr{Void},userdata::Ptr{Void})
    ccall((:tox_callback_group_title,libtoxcore),Void,(Ptr{Cint},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_callback_group_namelist_change(tox::Ptr{Cint},_function::Ptr{Void},userdata::Ptr{Void})
    ccall((:tox_callback_group_namelist_change,libtoxcore),Void,(Ptr{Cint},Ptr{Void},Ptr{Void}),tox,_function,userdata)
end

function tox_add_groupchat(tox::Ptr{Cint})
    ccall((:tox_add_groupchat,libtoxcore),Cint,(Ptr{Cint},),tox)
end

function tox_del_groupchat(tox::Ptr{Cint},groupnumber::Cint)
    ccall((:tox_del_groupchat,libtoxcore),Cint,(Ptr{Cint},Cint),tox,groupnumber)
end

function tox_group_peername(tox::Ptr{Cint},groupnumber::Cint,peernumber::Cint,name::Ptr{Cint})
    ccall((:tox_group_peername,libtoxcore),Cint,(Ptr{Cint},Cint,Cint,Ptr{Cint}),tox,groupnumber,peernumber,name)
end

function tox_group_peer_pubkey(tox::Ptr{Cint},groupnumber::Cint,peernumber::Cint,public_key::Ptr{Cint})
    ccall((:tox_group_peer_pubkey,libtoxcore),Cint,(Ptr{Cint},Cint,Cint,Ptr{Cint}),tox,groupnumber,peernumber,public_key)
end

function tox_invite_friend(tox::Ptr{Cint},friendnumber::Cint,groupnumber::Cint)
    ccall((:tox_invite_friend,libtoxcore),Cint,(Ptr{Cint},Cint,Cint),tox,friendnumber,groupnumber)
end

function tox_join_groupchat(tox::Ptr{Cint},friendnumber::Cint,data::Ptr{Cint},length::Cint)
    ccall((:tox_join_groupchat,libtoxcore),Cint,(Ptr{Cint},Cint,Ptr{Cint},Cint),tox,friendnumber,data,length)
end

function tox_group_message_send(tox::Ptr{Cint},groupnumber::Cint,message::Ptr{Cint},length::Cint)
    ccall((:tox_group_message_send,libtoxcore),Cint,(Ptr{Cint},Cint,Ptr{Cint},Cint),tox,groupnumber,message,length)
end

function tox_group_action_send(tox::Ptr{Cint},groupnumber::Cint,action::Ptr{Cint},length::Cint)
    ccall((:tox_group_action_send,libtoxcore),Cint,(Ptr{Cint},Cint,Ptr{Cint},Cint),tox,groupnumber,action,length)
end

function tox_group_set_title(tox::Ptr{Cint},groupnumber::Cint,title::Ptr{Cint},length::Cint)
    ccall((:tox_group_set_title,libtoxcore),Cint,(Ptr{Cint},Cint,Ptr{Cint},Cint),tox,groupnumber,title,length)
end

function tox_group_get_title(tox::Ptr{Cint},groupnumber::Cint,title::Ptr{Cint},max_length::Cint)
    ccall((:tox_group_get_title,libtoxcore),Cint,(Ptr{Cint},Cint,Ptr{Cint},Cint),tox,groupnumber,title,max_length)
end

function tox_group_peernumber_is_ours(tox::Ptr{Cint},groupnumber::Cint,peernumber::Cint)
    ccall((:tox_group_peernumber_is_ours,libtoxcore),Uint32,(Ptr{Cint},Cint,Cint),tox,groupnumber,peernumber)
end

function tox_group_number_peers(tox::Ptr{Cint},groupnumber::Cint)
    ccall((:tox_group_number_peers,libtoxcore),Cint,(Ptr{Cint},Cint),tox,groupnumber)
end

function tox_group_get_names(tox::Ptr{Cint},groupnumber::Cint,names::Ptr{Cint},lengths::Ptr{Cint},length::Cint)
    ccall((:tox_group_get_names,libtoxcore),Cint,(Ptr{Cint},Cint,Ptr{Cint},Ptr{Cint},Cint),tox,groupnumber,names,lengths,length)
end

function tox_count_chatlist()
    ccall((:tox_count_chatlist,libtoxcore),Cint,())
end

function tox_get_chatlist()
    ccall((:tox_get_chatlist,libtoxcore),Cint,())
end

function tox_group_get_type(tox::Ptr{Cint},groupnumber::Cint)
    ccall((:tox_group_get_type,libtoxcore),Cint,(Ptr{Cint},Cint),tox,groupnumber)
end
