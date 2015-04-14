using Compat

export ToxAv

typealias ToxAv Void
typealias ToxAVCallback Ptr{Void}
typealias ToxAvAudioCallback Ptr{Void}
typealias ToxAvVideoCallback Ptr{Void}

# begin enum ToxAvCallbackID
typealias ToxAvCallbackID Uint32
const av_OnInvite = @compat (UInt32)(0)
const av_OnRinging = @compat (UInt32)(1)
const av_OnStart = @compat (UInt32)(2)
const av_OnCancel = @compat (UInt32)(3)
const av_OnReject = @compat (UInt32)(4)
const av_OnEnd = @compat (UInt32)(5)
const av_OnRequestTimeout = @compat (UInt32)(6)
const av_OnPeerTimeout = @compat (UInt32)(7)
const av_OnPeerCSChange = @compat (UInt32)(8)
const av_OnSelfCSChange = @compat (UInt32)(9)
# end enum ToxAvCallbackID

# begin enum ToxAvCallType
typealias ToxAvCallType Uint32
const av_TypeAudio = @compat (UInt32)(192)
const av_TypeVideo = @compat (UInt32)(193)
# end enum ToxAvCallType

# begin enum ToxAvCallState
typealias ToxAvCallState Cint
const av_CallNonExistent = @compat (Int32)(-1)
const av_CallInviting = @compat (Int32)(0)
const av_CallStarting = @compat (Int32)(1)
const av_CallActive = @compat (Int32)(2)
const av_CallHold = @compat (Int32)(3)
const av_CallHungUp = @compat (Int32)(4)
# end enum ToxAvCallState

# begin enum ToxAvError
typealias ToxAvError Cint
const av_ErrorNone = @compat (Int32)(0)
const av_ErrorUnknown = @compat (Int32)(-1)
const av_ErrorNoCall = @compat (Int32)(-20)
const av_ErrorInvalidState = @compat (Int32)(-21)
const av_ErrorAlreadyInCallWithPeer = @compat (Int32)(-22)
const av_ErrorReachedCallLimit = @compat (Int32)(-23)
const av_ErrorInitializingCodecs = @compat (Int32)(-30)
const av_ErrorSettingVideoResolution = @compat (Int32)(-31)
const av_ErrorSettingVideoBitrate = @compat (Int32)(-32)
const av_ErrorSplittingVideoPayload = @compat (Int32)(-33)
const av_ErrorEncodingVideo = @compat (Int32)(-34)
const av_ErrorEncodingAudio = @compat (Int32)(-35)
const av_ErrorSendingPayload = @compat (Int32)(-40)
const av_ErrorCreatingRtpSessions = @compat (Int32)(-41)
const av_ErrorNoRtpSession = @compat (Int32)(-50)
const av_ErrorInvalidCodecState = @compat (Int32)(-51)
const av_ErrorPacketTooLarge = @compat (Int32)(-52)
# end enum ToxAvError

# begin enum ToxAvCapabilities
typealias ToxAvCapabilities Uint32
const av_AudioEncoding = @compat (UInt32)(1)
const av_AudioDecoding = @compat (UInt32)(2)
const av_VideoEncoding = @compat (UInt32)(4)
const av_VideoDecoding = @compat (UInt32)(8)
# end enum ToxAvCapabilities

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