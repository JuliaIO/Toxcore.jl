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

