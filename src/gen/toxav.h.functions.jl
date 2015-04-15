function toxav_new(messenger,max_calls)
    ccall((:toxav_new,libtoxcore),Ptr{ToxAv},(Ptr{Tox},Int32),messenger,max_calls)
end

function toxav_kill(av)
    ccall((:toxav_kill,libtoxcore),Void,(Ptr{ToxAv},),av)
end

function toxav_do_interval(av)
    ccall((:toxav_do_interval,libtoxcore),Uint32,(Ptr{ToxAv},),av)
end

function toxav_do(av)
    ccall((:toxav_do,libtoxcore),Void,(Ptr{ToxAv},),av)
end

function toxav_register_callstate_callback(av,cb,id,userdata)
    ccall((:toxav_register_callstate_callback,libtoxcore),Void,(Ptr{ToxAv},ToxAVCallback,ToxAvCallbackID,Ptr{Void}),av,cb,id,userdata)
end

function toxav_register_audio_callback(av,cb,userdata)
    ccall((:toxav_register_audio_callback,libtoxcore),Void,(Ptr{ToxAv},ToxAvAudioCallback,Ptr{Void}),av,cb,userdata)
end

function toxav_register_video_callback(av,cb,userdata)
    ccall((:toxav_register_video_callback,libtoxcore),Void,(Ptr{ToxAv},ToxAvVideoCallback,Ptr{Void}),av,cb,userdata)
end

function toxav_call(av,call_index,friend_id,csettings,ringing_seconds)
    ccall((:toxav_call,libtoxcore),Cint,(Ptr{ToxAv},Ptr{Int32},Cint,Ptr{ToxAvCSettings},Cint),av,call_index,friend_id,csettings,ringing_seconds)
end

function toxav_hangup(av,call_index)
    ccall((:toxav_hangup,libtoxcore),Cint,(Ptr{ToxAv},Int32),av,call_index)
end

function toxav_answer(av,call_index,csettings)
    ccall((:toxav_answer,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{ToxAvCSettings}),av,call_index,csettings)
end

function toxav_reject(av,call_index,reason)
    ccall((:toxav_reject,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{Uint8}),av,call_index,reason)
end

function toxav_cancel(av,call_index,peer_id,reason)
    ccall((:toxav_cancel,libtoxcore),Cint,(Ptr{ToxAv},Int32,Cint,Ptr{Uint8}),av,call_index,peer_id,reason)
end

function toxav_change_settings(av,call_index,csettings)
    ccall((:toxav_change_settings,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{ToxAvCSettings}),av,call_index,csettings)
end

function toxav_stop_call(av,call_index)
    ccall((:toxav_stop_call,libtoxcore),Cint,(Ptr{ToxAv},Int32),av,call_index)
end

function toxav_prepare_transmission(av,call_index,support_video)
    ccall((:toxav_prepare_transmission,libtoxcore),Cint,(Ptr{ToxAv},Int32,Cint),av,call_index,support_video)
end

function toxav_kill_transmission(av,call_index)
    ccall((:toxav_kill_transmission,libtoxcore),Cint,(Ptr{ToxAv},Int32),av,call_index)
end

function toxav_prepare_video_frame(av,call_index,dest,dest_max,input)
    ccall((:toxav_prepare_video_frame,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{Uint8},Cint,Ptr{vpx_image_t}),av,call_index,dest,dest_max,input)
end

function toxav_send_video(av,call_index,frame,frame_size)
    ccall((:toxav_send_video,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{Uint8},Uint32),av,call_index,frame,frame_size)
end

function toxav_prepare_audio_frame(av,call_index,dest,dest_max,frame,frame_size)
    ccall((:toxav_prepare_audio_frame,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{Uint8},Cint,Ptr{Int16},Cint),av,call_index,dest,dest_max,frame,frame_size)
end

function toxav_send_audio(av,call_index,frame,size)
    ccall((:toxav_send_audio,libtoxcore),Cint,(Ptr{ToxAv},Int32,Ptr{Uint8},Uint32),av,call_index,frame,size)
end

function toxav_get_peer_csettings(av,call_index,peer,dest)
    ccall((:toxav_get_peer_csettings,libtoxcore),Cint,(Ptr{ToxAv},Int32,Cint,Ptr{ToxAvCSettings}),av,call_index,peer,dest)
end

function toxav_get_peer_id(av,call_index,peer)
    ccall((:toxav_get_peer_id,libtoxcore),Cint,(Ptr{ToxAv},Int32,Cint),av,call_index,peer)
end

function toxav_get_call_state(av,call_index)
    ccall((:toxav_get_call_state,libtoxcore),ToxAvCallState,(Ptr{ToxAv},Int32),av,call_index)
end

function toxav_capability_supported(av,call_index,capability)
    ccall((:toxav_capability_supported,libtoxcore),Cint,(Ptr{ToxAv},Int32,ToxAvCapabilities),av,call_index,capability)
end

function toxav_get_tox(av)
    ccall((:toxav_get_tox,libtoxcore),Ptr{Tox},(Ptr{ToxAv},),av)
end

function toxav_get_active_count(av)
    ccall((:toxav_get_active_count,libtoxcore),Cint,(Ptr{ToxAv},),av)
end

function toxav_add_av_groupchat(tox,audio_callback,userdata)
    ccall((:toxav_add_av_groupchat,libtoxcore),Cint,(Ptr{Tox},Ptr{Void},Ptr{Void}),tox,audio_callback,userdata)
end

function toxav_join_av_groupchat(tox,friendnumber,data,length,audio_callback,userdata)
    ccall((:toxav_join_av_groupchat,libtoxcore),Cint,(Ptr{Tox},Int32,Ptr{Uint8},Uint16,Ptr{Void},Ptr{Void}),tox,friendnumber,data,length,audio_callback,userdata)
end

function toxav_group_send_audio(tox,groupnumber,pcm,samples,channels,sample_rate)
    ccall((:toxav_group_send_audio,libtoxcore),Cint,(Ptr{Tox},Cint,Ptr{Int16},Uint32,Uint8,Uint32),tox,groupnumber,pcm,samples,channels,sample_rate)
end