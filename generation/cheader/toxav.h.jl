# Julia wrapper for header: cheader/toxav.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function toxav_new(messenger::Ptr{Tox},max_calls::Int32)
    ccall((:toxav_new,libtoxcore),Ptr{ToxAv},(Ptr{Tox},Int32),messenger,max_calls)
end

function toxav_kill(av::Ptr{ToxAv})
    ccall((:toxav_kill,libtoxcore),Void,(Ptr{ToxAv},),av)
end

function toxav_do_interval(av::Ptr{ToxAv})
    ccall((:toxav_do_interval,libtoxcore),Uint32,(Ptr{ToxAv},),av)
end

function toxav_do(av::Ptr{ToxAv})
    ccall((:toxav_do,libtoxcore),Void,(Ptr{ToxAv},),av)
end

function toxav_register_callstate_callback(av::Ptr{ToxAv},cb::ToxAVCallback,id::ToxAvCallbackID,userdata::Ptr{Void})
    ccall((:toxav_register_callstate_callback,libtoxcore),Void,(Ptr{ToxAv},ToxAVCallback,ToxAvCallbackID,Ptr{Void}),av,cb,id,userdata)
end

function toxav_register_audio_callback(av::Ptr{ToxAv},cb::ToxAvAudioCallback,userdata::Ptr{Void})
    ccall((:toxav_register_audio_callback,libtoxcore),Void,(Ptr{ToxAv},ToxAvAudioCallback,Ptr{Void}),av,cb,userdata)
end

function toxav_register_video_callback(av::Ptr{ToxAv},cb::ToxAvVideoCallback,userdata::Ptr{Void})
    ccall((:toxav_register_video_callback,libtoxcore),Void,(Ptr{ToxAv},ToxAvVideoCallback,Ptr{Void}),av,cb,userdata)
end

function toxav_call(av::Ptr{ToxAv},call_index::Ptr{Int32},friend_id::Cint,csettings::Ptr{ToxAvCSettings},ringing_seconds::Cint)
    ccall((:toxav_call,libtoxcore),Cint,(Ptr{ToxAv},Ptr{Int32},Cint,Ptr{ToxAvCSettings},Cint),av,call_index,friend_id,csettings,ringing_seconds)
end

function toxav_hangup(av::Ptr{ToxAv},call_index::Int32)
    ccall((:toxav_hangup,libtoxcore),Cint,(Ptr{ToxAv},Int32),av,call_index)
end

function toxav_answer(av::Ptr{ToxAv},call_index::Int32,csettings::Ptr{ToxAvCSettings})
    ccall((:toxav_answer,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{ToxAvCSettings}),av,call_index,csettings)
end

function toxav_reject(av::Ptr{ToxAv},call_index::Int32,reason::Ptr{Uint8})
    ccall((:toxav_reject,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{Uint8}),av,call_index,reason)
end

function toxav_cancel(av::Ptr{ToxAv},call_index::Int32,peer_id::Cint,reason::Ptr{Uint8})
    ccall((:toxav_cancel,libtoxcore),Cint,(Ptr{ToxAv},Int32,Cint,Ptr{Uint8}),av,call_index,peer_id,reason)
end

function toxav_change_settings(av::Ptr{ToxAv},call_index::Int32,csettings::Ptr{ToxAvCSettings})
    ccall((:toxav_change_settings,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{ToxAvCSettings}),av,call_index,csettings)
end

function toxav_stop_call(av::Ptr{ToxAv},call_index::Int32)
    ccall((:toxav_stop_call,libtoxcore),Cint,(Ptr{ToxAv},Int32),av,call_index)
end

function toxav_prepare_transmission(av::Ptr{ToxAv},call_index::Int32,support_video::Cint)
    ccall((:toxav_prepare_transmission,libtoxcore),Cint,(Ptr{ToxAv},Int32,Cint),av,call_index,support_video)
end

function toxav_kill_transmission(av::Ptr{ToxAv},call_index::Int32)
    ccall((:toxav_kill_transmission,libtoxcore),Cint,(Ptr{ToxAv},Int32),av,call_index)
end

function toxav_prepare_video_frame(av::Ptr{ToxAv},call_index::Int32,dest::Ptr{Uint8},dest_max::Cint,input::Ptr{Cint})
    ccall((:toxav_prepare_video_frame,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{Uint8},Cint,Ptr{Cint}),av,call_index,dest,dest_max,input)
end

function toxav_send_video(av::Ptr{ToxAv},call_index::Int32,frame::Ptr{Uint8},frame_size::Uint32)
    ccall((:toxav_send_video,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{Uint8},Uint32),av,call_index,frame,frame_size)
end

function toxav_prepare_audio_frame(av::Ptr{ToxAv},call_index::Int32,dest::Ptr{Uint8},dest_max::Cint,frame::Ptr{Int16},frame_size::Cint)
    ccall((:toxav_prepare_audio_frame,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{Uint8},Cint,Ptr{Int16},Cint),av,call_index,dest,dest_max,frame,frame_size)
end

function toxav_send_audio(av::Ptr{ToxAv},call_index::Int32,frame::Ptr{Uint8},size::Uint32)
    ccall((:toxav_send_audio,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{Uint8},Uint32),av,call_index,frame,size)
end

function toxav_get_peer_csettings(av::Ptr{ToxAv},call_index::Int32,peer::Cint,dest::Ptr{ToxAvCSettings})
    ccall((:toxav_get_peer_csettings,libtoxcore),Cint,(Ptr{ToxAv},Int32,Cint,Ptr{ToxAvCSettings}),av,call_index,peer,dest)
end

function toxav_get_peer_id(av::Ptr{ToxAv},call_index::Int32,peer::Cint)
    ccall((:toxav_get_peer_id,libtoxcore),Cint,(Ptr{ToxAv},Int32,Cint),av,call_index,peer)
end

function toxav_get_call_state(av::Ptr{ToxAv},call_index::Int32)
    ccall((:toxav_get_call_state,libtoxcore),ToxAvCallState,(Ptr{ToxAv},Int32),av,call_index)
end

function toxav_capability_supported(av::Ptr{ToxAv},call_index::Int32,capability::ToxAvCapabilities)
    ccall((:toxav_capability_supported,libtoxcore),Cint,(Ptr{ToxAv},Int32,ToxAvCapabilities),av,call_index,capability)
end

function toxav_get_tox(av::Ptr{ToxAv})
    ccall((:toxav_get_tox,libtoxcore),Ptr{Tox},(Ptr{ToxAv},),av)
end

function toxav_get_active_count(av::Ptr{ToxAv})
    ccall((:toxav_get_active_count,libtoxcore),Cint,(Ptr{ToxAv},),av)
end

function toxav_add_av_groupchat(tox::Ptr{Tox},audio_callback::Ptr{Void},userdata::Ptr{Void})
    ccall((:toxav_add_av_groupchat,libtoxcore),Cint,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,audio_callback,userdata)
end

function toxav_join_av_groupchat(tox::Ptr{Tox},friendnumber::Int32,data::Ptr{Uint8},length::Uint16,audio_callback::Ptr{Void},userdata::Ptr{Void})
    ccall((:toxav_join_av_groupchat,libtoxcore),Cint,(Ptr{Tox},Int32,Ptr{Uint8},Uint16,Ptr{Void},Ptr{Void}),tox,friendnumber,data,length,audio_callback,userdata)
end

function toxav_group_send_audio(tox::Ptr{Tox},groupnumber::Cint,pcm::Ptr{Int16},samples::Uint32,channels::Uint8,sample_rate::Uint32)
    ccall((:toxav_group_send_audio,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Int16},Uint32,Uint8,Uint32),tox,groupnumber,pcm,samples,channels,sample_rate)
end
